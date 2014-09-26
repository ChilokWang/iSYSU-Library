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
#import "MJRefresh.h"
#import "Constants.h"
#import "SLRestfulEngine.h"

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
    
    CGRect f = [[UIScreen mainScreen] bounds];
    screenFrame = f;
    CGFloat h = self.navigationController.navigationBar.frame.size.height;
    barHeight = h;
    
    CGRect recommendTableFrame = CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height);
    
    _recommendTable = [[SLRecommendTableView alloc] initWithFrame:recommendTableFrame];
    _recommendTable.delegate = self;
    _recommendTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_recommendTable];
    
    [self setUpRefresh];
    
}

- (void)loadData
{
    [SLRestfulEngine loadBorRecommendOnSucceed:^(NSMutableArray *resultArray) {
        
        [_recommendTable setDataArr:resultArray];
        
    } onError:^(NSError *engineError) {
        NSLog(@"Load hold error:%@", engineError);
    }];
}

//集成刷新控件
- (void)setUpRefresh
{
    [_recommendTable addHeaderWithTarget:self action:@selector(headerRefresh)];
    [_recommendTable addFooterWithTarget:self action:@selector(footerRefresh)];
    //进入界面即开始刷新
    [_recommendTable headerBeginRefreshing];
    //设置刷新控件显示文字
    _recommendTable.headerPullToRefreshText = @"继续下拉可以刷新！";
    _recommendTable.headerReleaseToRefreshText = @"松开可以进行刷新！";
    _recommendTable.headerRefreshingText = @"列表正在刷新，请稍后！";
    
    _recommendTable.footerPullToRefreshText = @"继续上拉可以刷新！";
    _recommendTable.footerReleaseToRefreshText = @"松开可以进行刷新！";
    _recommendTable.footerRefreshingText = @"列表正在加载，请稍后！";
}

- (void)headerRefresh
{
    [self loadData];
    [_recommendTable reloadData];
    [_recommendTable headerEndRefreshing];
}

- (void)footerRefresh
{
    
}

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
//    detailVC.bookInfo = @[
//                          @[@{
//                                @"bookCoverImageUrl": [NSString stringWithFormat:@"%d", 1],
//                                @"bookName":  @"Objective-C高级编程 : iOS与OS X多线程和内存管理",
//                                @"bookId":    @"978-7-115-31809-1",
//                                @"bookAuthor":  @"(日) Kazuki Sakamoto, Tomohiko Furumoto著 ; 黎华译",
//                                @"bookPress":  @"人民邮电出版社",
//                                }],
//                          @[@{
//                                @"brief":  @"本书在苹果公司公开的源代码基础上，深入剖析了对应用于内存管理的ARC以及应用于多线程开发的Blocks和GCD。内容包括：自动引用计数、Blocks、Grand Central Dispatch等。"
//                                }],
//                          @[@{
//                                @"bookState":    @"外借本",
//                                @"dueDate":    @"在架上",
//                                @"branch":     @"南校区中文新书库(1楼)",
//                                @"rackPosition":       @"TP312C/1987",
//                                @"requests":     @"0",
//                                },
//                            @{
//                                @"bookState":    @"外借本",
//                                @"dueDate":    @"20141008",
//                                @"branch":     @"东校区普通图书(3楼)",
//                                @"rackPosition":       @"TP312C/1987",
//                                @"requests":     @"1"
//                                }
//                            ]
//                          ];
    [self.navigationController pushViewController:detailVC animated:true];
    
}

@end
