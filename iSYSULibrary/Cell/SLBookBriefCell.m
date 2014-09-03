//
//  SLBookBriefCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBriefCell.h"

@implementation SLBookBriefCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.briefLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 0, 0)];
        self.briefLabel.font = [UIFont systemFontOfSize:14.0];
        self.briefLabel.textColor = [UIColor darkGrayColor];
        self.briefLabel.numberOfLines = 0;
        [self addSubview:self.briefLabel];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)configureWithDictionary:(NSDictionary *)dic
{
    self.briefLabel.text = dic[@"brief"];
    [self.briefLabel sizeToFit];
    CGRect frame = self.frame;
    frame.size.height = self.briefLabel.frame.size.height + 20;
    frame.origin.x -= 10;
    frame.size.width += 20;
    [self setFrame:frame];
}

@end
