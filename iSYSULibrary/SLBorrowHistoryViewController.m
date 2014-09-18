//
//  SLBorrowHistoryViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/5/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBorrowHistoryViewController.h"
#import "SLBookDetailViewController.h"
#import "XDKAirMenuController.h"

@interface SLBorrowHistoryViewController ()

@end

@implementation SLBorrowHistoryViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Button Method

- (IBAction)menuButtonPressed:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
