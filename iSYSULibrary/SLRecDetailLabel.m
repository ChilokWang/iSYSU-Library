//
//  SLRecDetailLabel.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecDetailLabel.h"

@implementation SLRecDetailLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setFont:[UIFont systemFontOfSize:14.0]];
        [self setTextColor:[UIColor darkGrayColor]];
        [self setNumberOfLines:0];
    }
    return self;
}

@end
