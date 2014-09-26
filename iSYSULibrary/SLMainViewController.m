//
//  SLMainViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLMainViewController.h"
#import "XDKAirMenuController.h"
#import "SLBookDetailViewController.h"
#import "SLRestfulEngine.h"
#import "SLBookBaseModel.h"
#import "AsynImageView.h"
#import "SLBookView.h"
#import "AppCache.h"
#import "Constants.h"
#import "SVProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

@interface SLMainViewController ()
@property (nonatomic, strong) NSArray *books;
@property (nonatomic, strong) UIBarButtonItem *backButtonItem;
@property (nonatomic, assign) BOOL isOpen;
@end

@implementation SLMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureCollectionView];
    [self configureNavigationItem];
    self.isOpen = false;
    self.books = [AppCache getCachedNewBooks];
    if (self.books == nil) {
        self.books = [NSArray array];
    }
    [SLRestfulEngine loadNewBookWithPage:0 onSucceed:^(NSMutableArray *resultArray) {
        [AppCache cacheNewBooks:resultArray];
        self.books = resultArray;
        [self.collectionView reloadData];
    } onError:^(NSError *engineError) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Configure Appearence

- (void)configureCollectionView
{
    self.collectionView.backgroundColor = kApplicationGrayColor;
    self.collectionView.alwaysBounceVertical = YES;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

- (void)configureNavigationItem
{
    if (self.backButtonItem == nil) {
        self.backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self action:@selector(closeButtonPressed:)];
        self.backButtonItem.tintColor = [UIColor whiteColor];
    }
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(menuButtonPressed:)];
    leftButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonPressed:)];
    rightButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
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

- (void)searchButtonPressed:(id)sender
{
    [self performSegueWithIdentifier:@"SearchBook" sender:self];
}

- (void)closeButtonPressed:(id)sender
{
    if (self.isOpen) {
        [self dismissViewControllerAnimated:true completion:^{
            self.title = @"首页";
            [_bookView removeFromSuperview];
            _bookView = nil;
            [self configureNavigationItem];
            self.isOpen = false;
        }];
    }
    
}

- (void)refresh
{
    
}

- (void)loadMore
{
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.books.count;
}

#define kBookViewTag 1

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"photoCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    AsynImageView *imageView = (AsynImageView *)[cell viewWithTag:kBookViewTag];
    SLBookBaseModel *book = self.books[indexPath.row];
    imageView.imageURL = book.bookCoverImageUrl;
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isOpen) {
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        CGRect frame = cell.frame;
        frame.origin.y -= collectionView.contentOffset.y;
        AsynImageView *imageView = (AsynImageView *)[cell viewWithTag:kBookViewTag];
        UIImage *image = imageView.image;
        _bookView = [[SLBookView alloc] initWithFrame:frame];
        [_bookView setupBookCoverImage:image];
        [self.view addSubview:_bookView];
        SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
        SLBookBaseModel *book = [self.books objectAtIndex:indexPath.row];
        NSArray *distrubution = book.distribution;
        detailVC.modalTransitionStyle = UIModalTransitionStyleOpenBooks;
        detailVC.bookCoverImage = image;
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
        self.isOpen = true;
        [self presentViewController:detailVC animated:YES completion:^{
            self.title = @"图书详情";
            self.navigationItem.leftBarButtonItem = self.backButtonItem;
            self.navigationItem.rightBarButtonItem = nil;
        }];
    }
    
}

@end
