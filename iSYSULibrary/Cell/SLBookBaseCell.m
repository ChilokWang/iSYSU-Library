//
//  SLBookBaseCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseCell.h"
#import "SLBookCoverCell.h"
#import "SLBookBriefCell.h"
#import "SLBookDistributionCell.h"

@implementation SLBookBaseCell

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(frame.origin.x + 10, frame.origin.y, frame.size.width - 20, frame.size.height);
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)TableCellWithInfoTitle:(InfoTitle)title
{
    switch (title) {
        case BookCoverInfo:
            return [SLBookCoverCell new];
            break;
        case BookBriefInfo:
            return [SLBookBriefCell new];
            break;
        case BookDistributionInfo:
            return [SLBookDistributionCell new];
            break;
        default:
            break;
    }
    return nil;
}

- (void)configureWithDictionary:(NSDictionary *)dic
{
    
}
@end
