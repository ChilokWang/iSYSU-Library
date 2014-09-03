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
#import "SLBookView.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>

@interface SLMainViewController ()
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
    [self configureNavigationItem];
    self.collectionView.backgroundColor = kApplicationGrayColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyNavBarAlpha:) name:kNotificationModifyNavBarAlpha object:nil];
    self.isOpen = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)configureNavigationItem
{
    if (self.backButtonItem == nil) {
        self.backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self action:@selector(closeBookDetailVC)];
        self.backButtonItem.tintColor = [UIColor whiteColor];
    }
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(menuButtonPressed:)];
    leftButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonPressed:)];
    rightButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

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

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

#define kBookViewTag 1

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"photoCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    UIImage *thumbnail = [UIImage imageNamed:[NSString stringWithFormat:@"%d", indexPath.row + 1]];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:kBookViewTag];
    imageView.image = thumbnail;
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isOpen) {
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        CGRect frame = cell.frame;
        frame.origin.y -= collectionView.contentOffset.y;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d", indexPath.row+1]];
        _bookView = [[SLBookView alloc] initWithFrame:frame];
        [_bookView setupBookCoverImage:image];
        [self.view addSubview:_bookView];
        SLBookDetailViewController *detailVC = [[SLBookDetailViewController alloc] init];
        detailVC.modalTransitionStyle = UIModalTransitionStyleOpenBooks;
        detailVC.bookCoverImage = image;
        detailVC.bookInfo = @[
                              @[@{
                                    @"bookCoverImageUrl": [NSString stringWithFormat:@"%d", indexPath.row + 1],
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
        self.isOpen = true;
        [self presentViewController:detailVC animated:YES completion:^{
            self.title = @"图书详情";
            self.navigationItem.leftBarButtonItem = self.backButtonItem;
            self.navigationItem.rightBarButtonItem = nil;
        }];
    }
    
}

- (void)closeBookDetailVC
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

- (void)modifyNavBarAlpha:(NSNotification *)aNotification
{
//    NSDictionary *notiObj = [aNotification object];
//    float alpha = [notiObj[@"alpha"] floatValue];
//    self.navigationController.navigationBar.alpha = alpha;
}
@end
