//
//  SLBorrowCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowCell.h"

@implementation SLBorrowCell
@synthesize deadline;
@synthesize borrowDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameFrame = self.name.frame;
        CGRect bdFrame = CGRectMake(nameFrame.origin.x,
                                    nameFrame.origin.y + nameFrame.size.height + 5,
                                    nameFrame.size.width, nameFrame.size.height);
        CGRect dlFrame = CGRectMake(bdFrame.origin.x,
                                    bdFrame.origin.y + bdFrame.size.height + 5,
                                    bdFrame.size.width, bdFrame.size.height);
        
        borrowDate = [[UILabel alloc] initWithFrame:bdFrame];
        borrowDate.backgroundColor = [UIColor clearColor];
        borrowDate.text = [NSString stringWithFormat:@"XyearXmonthXday"];
        borrowDate.textColor = [UIColor darkGrayColor];
        
        deadline = [[UILabel alloc] initWithFrame:dlFrame];
        deadline.backgroundColor = [UIColor clearColor];
        deadline.text = [NSString stringWithFormat:@"XyearXmonthXday"];
        deadline.textColor = [UIColor darkGrayColor];

        [self addSubview:borrowDate];
        [self addSubview:deadline];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
