//
//  SLRecommendCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendCell.h"
#import "SLRecommendBook.h"
#import "AsynImageView.h"

@implementation SLRecommendCell
@synthesize reason;
@synthesize status;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect nameFrame = self.name.frame;
        nameFrame.origin = CGPointMake(10, 10);
        nameFrame.size.width += 30;
        CGRect reaFrame = CGRectMake(nameFrame.origin.x,
                                     nameFrame.origin.y + nameFrame.size.height,
                                     nameFrame.size.width, nameFrame.size.height * 4);
        CGRect stFrame = CGRectMake(self.frame.size.width - 65,
                                    self.frame.size.height / 2 + 30 / 2, 50, 30);
        
        reason = [[UILabel alloc] initWithFrame:reaFrame];
        reason.backgroundColor = [UIColor clearColor];
        reason.textColor = [UIColor darkGrayColor];
        reason.font = [UIFont systemFontOfSize:14.0];
        reason.numberOfLines = 0;
        
        status = [[UILabel alloc] initWithFrame:stFrame];
        status.backgroundColor = [UIColor clearColor];
        status.textColor = [UIColor grayColor];
        status.font = [UIFont systemFontOfSize:12.0];
        
        [self addSubview:reason];
        [self addSubview:status];
        
        [self.bookCover setHidden:YES];
        self.name.frame = nameFrame;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithData:(SLRecommendBook *)data
{
    self.name.text = data.bookName;
    self.reason.text = [NSString stringWithFormat:@"荐购理由:\n%@", data.reason];
//    self.bookCover.backgroundColor = [UIColor darkGrayColor];

    if([data.status intValue] == 0)
        self.status.text = @"已订购";
    else if([data.status intValue] == 1)
        self.status.text = @"未订购";
}

@end
