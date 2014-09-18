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
    NSInteger listCount;
}
@synthesize borrowTable;

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
    
    CGRect borrowTableFrame = CGRectMake(0, 64, 320, 500);
    
    borrowTable = [[SLBorrowListTableView alloc] initWithFrame:borrowTableFrame];
    borrowTable.delegate = self;
    [self.view addSubview:borrowTable];
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




@end
