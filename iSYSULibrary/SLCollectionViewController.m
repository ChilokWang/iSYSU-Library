//
//  SLCollectionViewController.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLCollectionViewController.h"
#import "SLBookView.h"
#import <QuartzCore/QuartzCore.h>

#define DURING_TIME         1.0

@interface SLCollectionViewController ()
{
    CGPoint _bookViewOrignCenter;
    UIModalTransitionStyle _modalTransitionStyle;
}
@end

@implementation SLCollectionViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    _modalTransitionStyle = viewControllerToPresent.modalTransitionStyle;
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        NSAssert(_bookView, @"_bookView can not be nil");
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeBook)];
        [_bookView addGestureRecognizer:tapGesture];
        _bookView.content = viewControllerToPresent.view;
        CGFloat scaleX = self.view.bounds.size.width / _bookView.bounds.size.width;
        CGFloat scaleY = self.view.bounds.size.height / _bookView.bounds.size.height;
        [_bookView insertSubview:_bookView.content aboveSubview:_bookView.cover];
        _bookView.content.transform = CGAffineTransformMakeScale(1/scaleX, 1/scaleY);
        _bookView.content.frame = CGRectMake(0, 0,CGRectGetWidth(_bookView.frame), CGRectGetHeight(_bookView.frame));
        CATransform3D transformblank = CATransform3DMakeRotation(-M_PI_2 / 1.01, 0.0, 1.0, 0.0);
        transformblank.m34 = 1.0f / 250.0f;
        _bookView.cover.layer.anchorPoint = CGPointMake(0, 0.5);
        _bookView.cover.center = CGPointMake(0.0, _bookView.cover.bounds.size.height/2.0); //compensate for anchor offset
        _bookView.cover.opaque = YES;
        _bookViewOrignCenter = _bookView.center;
        
        
        CGFloat duringTime = DURING_TIME;
        
        if (!flag) {
            duringTime = 0.0f;
        }
        
        [UIView animateWithDuration:duringTime delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            self.navigationController.navigationBar.alpha = 0.0;
            _bookView.transform = CGAffineTransformMakeScale(scaleX,scaleY);
            _bookView.center = self.view.center;
            _bookView.cover.layer.transform = transformblank;
            [_bookView bringSubviewToFront:_bookView.cover];
        } completion:^(BOOL finished) {
            if (finished) {
                _bookView.cover.layer.hidden = YES;
                if (completion != nil) {
                    completion();
                }
            }
        } ];
    }
    else {
        [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    if (_modalTransitionStyle == UIModalTransitionStyleOpenBooks) {
        
        NSAssert(_bookView, @"_bookView can not be nil");
        
        _bookView.cover.layer.hidden = NO;
        CGFloat duringTime = DURING_TIME;
        if (!flag) {
            duringTime = 0.0f;
        }
        [UIView animateWithDuration:duringTime delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            self.navigationController.navigationBar.alpha = 1.0;
            _bookView.center = _bookViewOrignCenter;
            _bookView.transform = CGAffineTransformIdentity;
            _bookView.cover.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            if (finished) {
                [_bookView.content removeFromSuperview];
                [_bookView removeFromSuperview];
                _bookView = nil;
                if (completion != nil) {
                    completion();
                }
            }
        } ];
    }
    else {
        [super dismissViewControllerAnimated:flag completion:completion];
    }
}

- (void)closeBook
{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
