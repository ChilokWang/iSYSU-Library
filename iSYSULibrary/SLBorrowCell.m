//
//  SLBorrowCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-4.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowCell.h"
#import "SLBorrowingBook.h"
#import "AsynImageView.h"

@implementation SLBorrowCell
@synthesize retDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameFrame = self.name.frame;
        CGRect dlFrame = CGRectMake(nameFrame.origin.x,
                                    nameFrame.origin.y + nameFrame.size.height + 5,
                                    nameFrame.size.width, nameFrame.size.height);
        
        retDate = [[UILabel alloc] initWithFrame:dlFrame];
        retDate.backgroundColor = [UIColor clearColor];
        retDate.text = [NSString stringWithFormat:@"XyearXmonthXday"];
        retDate.textColor = [UIColor darkGrayColor];

        [self addSubview:retDate];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithData:(SLBorrowingBook *)data
{
    [super configureWithData:data];
    self.retDate.text = [NSString stringWithFormat:@"归还日期：%@", data.retDate];
}

@end
