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

#define CELL_HIGHT 100

@interface SLBorrowListController ()

@end

@implementation SLBorrowListController
{
    CGFloat contentOffsetY;
    CGFloat newContentOffsetY;
    CGFloat oldContentOffsetY;
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
    
    CGRect f = [[UIScreen mainScreen] bounds];
    screenFrame = f;
    CGFloat h = self.navigationController.navigationBar.frame.size.height;
    barHeight = h;
    
    CGRect borrowTableFrame = CGRectMake(0, 0, screenFrame.size.width, screenFrame.size.height);
    
    _borrowTable = [[SLBorrowListTableView alloc] initWithFrame:borrowTableFrame];
    _borrowTable.delegate = self;
    [self.view addSubview:_borrowTable];
    
    [self initRefreshHeaderView];
    [self initRefreshFooterView];
    
    
    
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
    return CELL_HIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
    detailVC.bookInfo = @[
                          @[@{
                                @"bookCoverImageUrl": [NSString stringWithFormat:@"%d", 1],
                                @"bookName":  @"Objective-C高级编程 : iOS与OS X多线程和内存管理",
                                @"bookId":    @"978-7-115-31809-1",
                                @"bookAuthor":  @"(日) Kazuki Sakamoto, Tomohiko Furumoto著 ; 黎华译",
                                @"bookPress":  @"人民邮电出版社",
                                }],
                          @[@{
                                @"brief":  @"本书在苹果公司公开的源代码基础上，深入剖析了对应用于内存管理的ARC以及应用于多线程开发的Blocks和GCD。内容包括：自动引用计数、Blocks、Grand Central Dispatch等。"
                                }],
                          @[@{
                                @"bookState":    @"外借本",
                                @"dueDate":    @"在架上",
                                @"branch":     @"南校区中文新书库(1楼)",
                                @"rackPosition":       @"TP312C/1987",
                                @"requests":     @"0",
                                },
                            @{
                                @"bookState":    @"外借本",
                                @"dueDate":    @"20141008",
                                @"branch":     @"东校区普通图书(3楼)",
                                @"rackPosition":       @"TP312C/1987",
                                @"requests":     @"1"
                                }
                            ]
                          ];
    [self.navigationController pushViewController:detailVC animated:true];
    
}

//刷新列表数据后，调整底部刷新空间的位置
- (void)adjustRefreshViewFrame
{

}

#pragma mark - refreshFooterView setting
- (void)initRefreshFooterView
{

}

- (void)loadOldData
{
    NSLog(@"loading old data");
#warning not finish here
    _reloading = YES;
}

- (void)doneLoadOldData
{
    NSLog(@"done loading old data");
    _reloading = NO;
    
    
    [_borrowTable reloadData];    //renew the appearance of the table
    
    [self adjustRefreshViewFrame];
}

#pragma mark - refreshHeaderView setting
- (void)initRefreshHeaderView
{

}

- (void)loadNewData
{
    NSLog(@"loading new data");
#warning not finish here
//    [_borrowTable setDataArr:_dataArray];
    _reloading = YES;
}

- (void)doneLoadNewData
{
    NSLog(@"done loading new data");
    [_borrowTable reloadData];
    _reloading = NO;
    
    
    [self adjustRefreshViewFrame];
}



#pragma mark - UIScrollView setting
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

}

@end
