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
                              @"bookName":  @"iOS 7",
                              @"bookId":    @"TN929.53",
                              @"bookAuthor":  @"刘一道著",
                              @"bookPress":  @"机械工业出版社",
                              }],
                          @[@{
                              @"brief":  @"第一部分　基础篇第1章　开篇综述\n1.1　iOS概述\n1.1.1　iOS介绍\n1.1.2　iOS 6新特性\n1.2　开发环境及开发工具\n1.3　本书中的约定\n1.3.1　案例代码约定\n1.3.2　图示的约定　\n第2章　第一个iOS应用程序\n2.1　创建基于nib的HelloWorld工程"
                              }],
                          @[@{
                                          @"bookState":    @"外借本",
                                          @"dueDate":    @"在架上",
                                          @"branch":     @"南校区中文新书库（1楼）",
                                          @"rackPosition":       @"TN929.53/245",
                                          @"requests":     @"0",
                                          },
                                      @{
                                          @"bookState":    @"外借本",
                                          @"dueDate":    @"在架上",
                                          @"branch":     @"东校区中文新书库（1楼）",
                                          @"rackPosition":       @"TN929.53/245",
                                          @"requests":     @"1"
                                          }
                                      ]
                          ];
    [self presentViewController:detailVC animated:YES completion:^{
        self.title = @"图书详情";
        self.navigationItem.leftBarButtonItem = self.backButtonItem;;
        self.navigationItem.rightBarButtonItem = nil;
    }];
}

- (void)closeBookDetailVC
{
    [self dismissViewControllerAnimated:true completion:^{
        self.title = @"首页";
        [_bookView removeFromSuperview];
        _bookView = nil;
        [self configureNavigationItem];
    }];
}

- (void)modifyNavBarAlpha:(NSNotification *)aNotification
{
//    NSDictionary *notiObj = [aNotification object];
//    float alpha = [notiObj[@"alpha"] floatValue];
//    self.navigationController.navigationBar.alpha = alpha;
}
@end
