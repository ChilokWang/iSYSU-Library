//
//  SLBookDetailViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookDetailViewController.h"
#import "Constants.h"

#define kHeadViewHeight 100

@interface SLBookDetailViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
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
    [self configureTableView];
    [self configureOrderButton];
}

- (void)configureTableView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (void)configureOrderButton
{
    CGRect frame = [UIScreen mainScreen].bounds;
    self.orderButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 100 - 10, frame.size.height - 40 - 10, 100, 40)];
    self.orderButton.layer.cornerRadius = 8.0;
    self.orderButton.backgroundColor = kApplicationGreenColor;
    self.orderButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.orderButton setTitle:@"预约" forState:UIControlStateNormal];
    [self.orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.orderButton setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
//    [self.orderButton addTarget:self action:@selector(pressOrderButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.orderButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.textLabel.text = @"Cell";
    
    return cell;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alpha = 0;
    
    if (scrollView.contentOffset.y >= kHeadViewHeight) {
        alpha = 1;
    }
    else if (scrollView.contentOffset.y > 0) {
        alpha = scrollView.contentOffset.y / kHeadViewHeight;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationModifyNavBarAlpha object:@{@"alpha": [NSNumber numberWithFloat:alpha]}];
}

@end
