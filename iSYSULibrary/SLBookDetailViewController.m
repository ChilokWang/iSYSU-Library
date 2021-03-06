//
//  SLBookDetailViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookDetailViewController.h"
#import "SLBookBaseCell.h"
#import "Constants.h"

@interface SLBookDetailViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *orderButton;
@end

@implementation SLBookDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kApplicationGrayColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self configureTableView];
    [self configureOrderButton];
}

- (void)configureTableView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    if (self.bookCoverImage) {
        frame.size.height -= 64;
        frame.origin.y += 64;
    }
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView.hidden = true;
    [self.view addSubview:self.tableView];
}

- (void)configureOrderButton
{
    if (self.bookCoverImage) {
        CGRect frame = [UIScreen mainScreen].bounds;
        self.orderButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 100 - 10, frame.size.height - 40 - 10, 100, 40)];
        self.orderButton.layer.cornerRadius = 8.0;
        self.orderButton.backgroundColor = kApplicationGreenColor;
        self.orderButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.orderButton setTitle:@"预约" forState:UIControlStateNormal];
        [self.orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.orderButton setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
        [self.orderButton addTarget:self action:@selector(orderButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.orderButton];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.bookInfo.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [(NSArray *)self.bookInfo[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [self identifierAtIndex:indexPath.section];
    SLBookBaseCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (!cell) {
        if (indexPath.section == 0) {
            cell = [SLBookBaseCell TableCellWithInfoTitle:BookCoverInfo];
        }
        else if (indexPath.section == 1) {
            cell = [SLBookBaseCell TableCellWithInfoTitle:BookBriefInfo];
        }
        else if (indexPath.section == 2) {
            cell = [SLBookBaseCell TableCellWithInfoTitle:BookDistributionInfo];
        }
        else if (indexPath.section == 3) {
            cell = [SLBookBaseCell TableCellWithInfoTitle:BookAppointInfo];
        }
        cell.layer.shadowOpacity = 0.15;
        cell.layer.shadowRadius = 1;
        cell.layer.shadowOffset = CGSizeMake(1, 1*tan(M_PI*60/180));
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell configureWithDictionary:[[self.bookInfo objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;    
}

#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    UIView *headerView = [[UIView alloc] init];
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(10, -5, 0, 0);
    headerLabel.font = [UIFont systemFontOfSize:15];
    headerLabel.text = [self headerNameAtIndex:section];
    [headerLabel sizeToFit];
    
    [headerView addSubview:headerLabel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 20;
    }
}

- (NSString *)identifierAtIndex: (NSInteger)index {
    return @[@"BookCover", @"BookBrief", @"BookDistribution", @"BookAppoint"][index];
}

- (NSString *)headerNameAtIndex: (NSInteger)index {
    return @[@"图书封面", @"摘要", @"馆藏分布情况", @"预约情况"][index];
}

#pragma mark ToDo

- (void)orderButtonPressed
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"预约成功" message:@"" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
