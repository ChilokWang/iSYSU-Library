//
//  SLAppointCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLAppointCell.h"

@implementation SLAppointCell
@synthesize deadline;
@synthesize takeBookPlace;
@synthesize status;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameFrame = self.name.frame;
        CGRect dlFrame = CGRectMake(nameFrame.origin.x,
                                    nameFrame.origin.y + nameFrame.size.height + 5,
                                    nameFrame.size.width, nameFrame.size.height);
        CGRect plFrame = CGRectMake(dlFrame.origin.x,
                                    dlFrame.origin.y + dlFrame.size.height + 5,
                                    dlFrame.size.width, dlFrame.size.height);
        CGRect stFrame = CGRectMake(self.frame.size.width - 60,
                                    self.frame.size.height / 2 + 30 / 2, 50, 20);

        deadline = [[UILabel alloc] initWithFrame:dlFrame];
        deadline.backgroundColor = [UIColor clearColor];
        deadline.textColor = [UIColor darkGrayColor];
        deadline.text = @"xxxx";
        
        takeBookPlace = [[UILabel alloc] initWithFrame:plFrame];
        takeBookPlace.backgroundColor = [UIColor clearColor];
        takeBookPlace.textColor = [UIColor darkGrayColor];
        takeBookPlace.text = @"xxx";
        
        status = [[UILabel alloc] initWithFrame:stFrame];
        status.backgroundColor = [UIColor clearColor];
        status.textColor = [UIColor grayColor];
        status.text = @"xxx";
        
        [self addSubview:deadline];
        [self addSubview:takeBookPlace];
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
