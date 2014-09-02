//
//  SLMainViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLMainViewController.h"
#import "XDKAirMenuController.h"
#import "SLBookView.h"
#import "Constants.h"
#import <QuartzCore/QuartzCore.h>

@interface SLMainViewController ()

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
    self.collectionView.backgroundColor = kApplicationGrayColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)menuButtonPressed:(id)sender
{
    XDKAirMenuController *menu = [XDKAirMenuController sharedMenu];
    
    if (menu.isMenuOpened)
        [menu closeMenuAnimated];
    else
        [menu openMenuAnimated];
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
    UIViewController *detailVC = [[UIViewController alloc] init];
    detailVC.modalTransitionStyle = UIModalTransitionStyleOpenBooks;
    [self presentViewController:detailVC animated:YES completion:nil];
}


@end
