//
//  SLRecommendController.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-3.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendController.h"
#import "XDKAirMenuController.h"
#import "SLRecommendDetailController.h"
#import "SLRecommendTableView.h"
#import "SLRecommendBook.h"
#import "MJRefresh.h"
#import "Constants.h"
#import "SLRestfulEngine.h"
#import "AppCache.h"

#define CELL_HEIGHT 100

@interface SLRecommendController ()

@end

@implementation SLRecommendController
{
    CGFloat barHeight;
    CGRect screenFrame;
}

@synthesize recommendTable = _recommendTable;

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
    
    [_recommendTable setDataArr:[AppCache getCachedRecommendBooks]];
    
    [_recommendTable headerBeginRefreshing];
}

- (void)configureTableView
{
    CGRect f = [[UIScreen mainScreen] bounds];
    screenFrame = f;
    CGFloat h = self.navigationController.navigationBar.frame.size.height;
    barHeight = h;
    
    CGRect recommendTableFrame = CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height);
    
    _recommendTable = [[SLRecommendTableView alloc] initWithFrame:recommendTableFrame];
    _recommendTable.delegate = self;
    _recommendTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_recommendTable];
}

//集成刷新控件
- (void)setUpRefresh
{
    [_recommendTable addHeaderWithTarget:self action:@selector(headerRefresh)];
//    [_recommendTable addFooterWithTarget:self action:@selector(footerRefresh)];

    //设置刷新控件显示文字
    _recommendTable.headerPullToRefreshText = @"继续下拉可以刷新！";
    _recommendTable.headerReleaseToRefreshText = @"松开可以进行刷新！";
    _recommendTable.headerRefreshingText = @"列表正在刷新，请稍后！";
    
//    _recommendTable.footerPullToRefreshText = @"继续上拉可以刷新！";
//    _recommendTable.footerReleaseToRefreshText = @"松开可以进行刷新！";
//    _recommendTable.footerRefreshingText = @"列表正在加载，请稍后！";
}

- (void)headerRefresh
{
    [SLRestfulEngine loadBorRecommendOnSucceed:^(NSMutableArray *resultArray) {
        [AppCache cacheRecommendBooks:resultArray];
        [_recommendTable setDataArr:resultArray];
        [_recommendTable reloadData];
        [_recommendTable headerEndRefreshing];
    } onError:^(NSError *engineError) {
        NSLog(@"Load hold error:%@", engineError);
        [_recommendTable setEmptyHintText:@"抱歉!服务器出错啦!\n请稍后再刷新界面。"];
        [_recommendTable headerEndRefreshing];
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
    SLRecommendDetailController *detailVC = [[SLRecommendDetailController alloc] init];
    SLRecommendBook *book = _recommendTable.dataArray[indexPath.row];
    NSLog(@"%@, %@", book.bookName, book.bookId);
    NSDictionary *dic = @{
                          @"bookName": book.bookName,
                          @"bookId": book.bookId,
                          @"bookAuthor": book.bookAuthor,
                          @"bookPress": book.bookPress,
                          @"recommendDate": book.recDate,
                          @"recommendReason": book.reason,
                          @"processingDate": book.proDate,
                          @"processingStatus": book.proStatus,
                          @"status": book.status
                          };
    detailVC.bookDic = dic;

    [self.navigationController pushViewController:detailVC animated:true];
    
}

@end
