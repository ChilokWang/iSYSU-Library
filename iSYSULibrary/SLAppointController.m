//
//  SLAppointController.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLAppointController.h"
#import "XDKAirMenuController.h"
#import "SLAppointTableView.h"
#import "SLBookDetailViewController.h"
#import "MJRefresh.h"
#import "Constants.h"
#import "SLRestfulEngine.h"
#import "SLAppointBook.h"
#import "AppCache.h"

#define CELL_HEIGHT 100

@interface SLAppointController ()

@end

@implementation SLAppointController
{
    CGFloat barHeight;
    CGRect screenFrame;
}

@synthesize appointTable = _appointTable;

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
    
    [_appointTable setDataArr:[AppCache getCachedAppointBooks]];

    //进入界面即开始刷新
    [_appointTable headerBeginRefreshing];
}

- (void)configureTableView
{
    CGRect f = [[UIScreen mainScreen] bounds];
    screenFrame = f;
    CGFloat h = self.navigationController.navigationBar.frame.size.height;
    barHeight = h;
    
    CGRect appointTableFrame = CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height);
    
    _appointTable = [[SLAppointTableView alloc] initWithFrame:appointTableFrame];
    _appointTable.delegate = self;
    _appointTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_appointTable];
}

//集成刷新控件
- (void)setUpRefresh
{
    [_appointTable addHeaderWithTarget:self action:@selector(headerRefresh)];
//    [_appointTable addFooterWithTarget:self action:@selector(footerRefresh)];
    //设置刷新控件显示文字
    _appointTable.headerPullToRefreshText = @"继续下拉可以刷新！";
    _appointTable.headerReleaseToRefreshText = @"松开可以进行刷新！";
    _appointTable.headerRefreshingText = @"列表正在刷新，请稍后！";
    
//    _appointTable.footerPullToRefreshText = @"继续上拉可以刷新！";
//    _appointTable.footerReleaseToRefreshText = @"松开可以进行刷新！";
//    _appointTable.footerRefreshingText = @"列表正在加载，请稍后！";
}

- (void)headerRefresh
{
    [SLRestfulEngine loadBorHoldOnSucceed:^(NSMutableArray *resultArray) {
        [AppCache cacheAppointBooks:resultArray];
        [_appointTable setDataArr:resultArray];
        [_appointTable reloadData];
        [_appointTable headerEndRefreshing];
    } onError:^(NSError *engineError) {
        NSLog(@"Load hold error:%@", engineError);
        [_appointTable setEmptyHintText:@"抱歉!服务器出错啦!\n请稍后再刷新界面。"];
        [_appointTable headerEndRefreshing];
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
    SLAppointBook *book = _appointTable.dataArray[indexPath.row];
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
                          book.distribution,
                          @[@{
                                @"validDate": book.validDate,
                                @"meetDate": book.meetDate,
                                @"requestStatus": book.reqStatus,
                                @"requestNum": book.reqNum
                                }]
                          ];
    [self.navigationController pushViewController:detailVC animated:true];
    
}

@end
