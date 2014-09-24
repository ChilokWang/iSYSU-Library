//
//  SLSearchResultViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 24/9/14.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLSearchResultViewController.h"

@interface SLSearchResultViewController ()

@end

@implementation SLSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configureTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BookSearchCellIdentifier" forIndexPath:indexPath];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
