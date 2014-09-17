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
@synthesize cover;
@synthesize name;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect coverFrame = CGRectMake(0, 0, 80, 100);
        CGRect nameFrame = CGRectMake(coverFrame.origin.x + coverFrame.size.width + 10,
                                       10, 200, 20);
        CGRect bdFrame = CGRectMake(nameFrame.origin.x,
                                    nameFrame.origin.y + nameFrame.size.height + 5,
                                    nameFrame.size.width, nameFrame.size.height);
        CGRect dlFrame = CGRectMake(bdFrame.origin.x,
                                    bdFrame.origin.y + bdFrame.size.height + 5,
                                    bdFrame.size.width, bdFrame.size.height);
        
        cover = [[UIImageView alloc] initWithFrame:coverFrame];
        cover.backgroundColor = [UIColor blackColor];
        
        name = [[UILabel alloc] initWithFrame:nameFrame];
        name.backgroundColor = [UIColor clearColor];
        name.text = [NSString stringWithFormat:@"ios开发指南"];
        
        borrowDate = [[UILabel alloc] initWithFrame:bdFrame];
        borrowDate.backgroundColor = [UIColor clearColor];
        borrowDate.text = [NSString stringWithFormat:@"XyearXmonthXday"];
        
        deadline = [[UILabel alloc] initWithFrame:dlFrame];
        deadline.backgroundColor = [UIColor clearColor];
        deadline.text = [NSString stringWithFormat:@"XyearXmonthXday"];

        
        [self addSubview:cover];
        [self addSubview:name];
        [self addSubview:borrowDate];
        [self addSubview:deadline];
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
