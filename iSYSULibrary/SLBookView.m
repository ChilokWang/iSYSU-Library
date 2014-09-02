//
//  SLBookView.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/2/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SLBookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:_cover];
    }
    return self;
}

- (void)setupBookCoverImage:(UIImage *)image
{
    if (_cover == nil) {
        _cover = [[UIView alloc] initWithFrame:self.frame];
        [self addSubview:_cover];
    }
    _cover.layer.contents = (__bridge id)(image.CGImage);
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
