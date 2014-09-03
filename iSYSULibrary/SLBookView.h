//
//  SLBookView.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLBookView : UIView

@property (nonatomic) UIView *cover;
@property (nonatomic) UIViewController *content;

- (void)setupBookCoverImage:(UIImage *)image;

@end
