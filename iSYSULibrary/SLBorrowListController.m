//
//  SLBorrowListController.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-11.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowListController.h"
#import "XDKAirMenuController.h"
#import "SLBorrowListTableView.h"
#import "SLBookDetailViewController.h"
#import "Constants.h"
#import "MJRefresh.h"
#import "SLRestfulEngine.h"
#import "SLBorrowingBook.h"
#import "AppCache.h"

#define CELL_HEIGHT 100

@interface SLBorrowListController ()

@end

@implementation SLBorrowListController
{
    CGFloat barHeight;
    CGRect screenFrame;
}

@synthesize borrowTable = _borrowTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:kApplicationGrayColor];
    
    [self configureTableView];
    
    [self setUpRefresh];
    
    [_borrowTable setDataArr:[AppCache getCachedMyLoanBooks]];
    //进入界面即开始刷新
    [_borrowTable headerBeginRefreshing];
}

- (void)configureTableView
{
    CGRect f = [[UIScreen mainScreen] bounds];
    screenFrame = f;
    CGFloat h = self.navigationController.navigationBar.frame.size.height;
    barHeight = h;
    
    CGRect borrowTableFrame = CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height);
    
    _borrowTable = [[SLBorrowListTableView alloc] initWithFrame:borrowTableFrame];
    _borrowTable.delegate = self;
    [self.view addSubview:_borrowTable];
}

//集成刷新控件
- (void)setUpRefresh
{
    [_borrowTable addHeaderWithTarget:self action:@selector(headerRefresh)];
//    [_borrowTable addFooterWithTarget:self action:@selector(footerRefresh)];
    
    //设置刷新控件显示文字
    _borrowTable.headerPullToRefreshText = @"继续下拉可以刷新！";
    _borrowTable.headerReleaseToRefreshText = @"松开可以进行刷新！";
    _borrowTable.headerRefreshingText = @"列表正在刷新，请稍后！";
    
//    _borrowTable.footerPullToRefreshText = @"继续上拉可以刷新！";
//    _borrowTable.footerReleaseToRefreshText = @"松开可以进行刷新！";
//    _borrowTable.footerRefreshingText = @"列表正在加载，请稍后！";
}

- (void)headerRefresh
{
    [SLRestfulEngine loadMyLoanOnSucceed:^(NSMutableArray *resultArray) {
        [AppCache cacheMyLoanBooks:resultArray];
        [_borrowTable setDataArr:resultArray];
        [_borrowTable reloadData];
        [_borrowTable headerEndRefreshing];
    } onError:^(NSError *engineError) {
        NSLog(@"Load my loan on error:%@", engineError);
        [_borrowTable setEmptyHintText:@"抱歉!服务器出错啦!\n请稍后再刷新界面。"];
        [_borrowTable headerEndRefreshing];
    }];

    
}

//- (void)footerRefresh
//{
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation action
- (IBAction)menuButtonPressed:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
    SLBorrowingBook *book = _borrowTable.dataArray[indexPath.row];
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


@end
