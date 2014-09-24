//
//  SLRecommendCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendCell.h"

@implementation SLRecommendCell
@synthesize reason;
@synthesize status;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect nameFrame = self.name.frame;
        CGRect reaFrame = CGRectMake(nameFrame.origin.x,
                                     nameFrame.origin.y + nameFrame.size.height + 5,
                                     nameFrame.size.width, nameFrame.size.height * 2);
        CGRect stFrame = CGRectMake(self.frame.size.width - 50,
                                    self.frame.size.height / 2 + 30 / 2, 50, 30);
        
        reason = [[UILabel alloc] initWithFrame:reaFrame];
        reason.backgroundColor = [UIColor clearColor];
        reason.textColor = [UIColor darkGrayColor];
        
        status = [[UILabel alloc] initWithFrame:stFrame];
        status.backgroundColor = [UIColor clearColor];
        status.textColor = [UIColor grayColor];
        
        [self addSubview:reason];
        [self addSubview:status];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
