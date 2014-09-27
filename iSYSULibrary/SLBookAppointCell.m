//
//  SLBookAppointCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookAppointCell.h"

@implementation SLBookAppointCell

- (id)initWithFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width += 20;
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SLBookAppointCell"
                                                     owner:self options:nil];
        self = (SLBookAppointCell *)[nib objectAtIndex:0];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)configureWithDictionary:(NSDictionary *)dic
{
    self.validDate.text = dic[@"validDate"];
    self.meetDate.text = dic[@"meetDate"];
    self.reqStatus.text = dic[@"requestStatus"];
    self.reqNum.text = dic[@"requestNum"];
}

@end
