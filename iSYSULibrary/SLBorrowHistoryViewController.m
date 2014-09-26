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
#import "SLHistoryCell.h"
#import "SLBorHistoryBook.h"
#import "SLRestfulEngine.h"
#import "AppCache.h"

@interface SLBorrowHistoryViewController ()
@property (nonatomic, strong) NSArray *books;
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
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    self.books = [AppCache getCachedHistoryBooks];
    if (self.books == nil) {
        self.books = [[NSArray alloc] init];
    }
    [self.tableView reloadData];
    [SLRestfulEngine loadLoanhistoryOnSucceed:^(NSMutableArray *resultArray) {
        if (resultArray != nil) {
            [AppCache cacheHistoryBooks:resultArray];
            self.books = resultArray;
            [self.tableView reloadData];
        }
    } onError:^(NSError *engineError) {
        NSLog(@"Error: %@", engineError);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refresh
{
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中"];
    [SLRestfulEngine loadLoanhistoryOnSucceed:^(NSMutableArray *resultArray) {
        if (resultArray != nil) {
            [AppCache cacheHistoryBooks:resultArray];
            self.books = resultArray;
        }
        [self.refreshControl endRefreshing];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [self.tableView reloadData];
    } onError:^(NSError *engineError) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [self.tableView reloadData];
        NSLog(@"Error: %@", engineError);
    }];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.books.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCellIdentifier" forIndexPath:indexPath];
    [cell configureWithBook:self.books[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
    SLBorHistoryBook *book = self.books[indexPath.row];
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
