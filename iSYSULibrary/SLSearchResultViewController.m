//
//  SLSearchResultViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 24/9/14.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLSearchResultViewController.h"
#import "SLBookDetailViewController.h"
#import "SVProgressHUD.h"
#import "SLBookSearchCell.h"
#import "SLBookBaseModel.h"
#import "SLRestfulEngine.h"

@interface SLSearchResultViewController ()
@property (nonatomic, strong) NSArray *books;
@end

@implementation SLSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    self.books = [NSArray array];
    [SVProgressHUD showWithStatus:@"搜索中" maskType:SVProgressHUDMaskTypeBlack];
//    NSLog(@"%@ %d", self.keyword, self.type);
    [SLRestfulEngine searchBookWithKeyword:self.keyword type:self.type page:1 onSucceed:^(NSMutableArray *resultArray) {
        [SVProgressHUD dismiss];
        self.books = resultArray;
        [self.tableView reloadData];
    } onError:^(NSError *engineError) {
        [SVProgressHUD showErrorWithStatus:@"网络出现问题"];
        NSLog(@"Error");
    }];
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
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLBookSearchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BookSearchCellIdentifier" forIndexPath:indexPath];
    SLBookBaseModel *book = self.books[indexPath.row];
    [cell configureWithBook:book];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
    SLBookBaseModel *book = self.books[indexPath.row];
    detailVC.bookInfo = @[
                          @[@{
                                @"bookCoverImageUrl": book.bookCoverImageUrl,
                                @"bookName":  book.bookName,
                                @"bookId":    book.bookId,
                                @"bookAuthor":  book.bookAuthor,
                                @"bookPress":  book.bookPress,
                                }],
                          @[@{
                                @"brief":  book.brief
                                }],
                          book.distribution
                          ];
    [self.navigationController pushViewController:detailVC animated:true];
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
