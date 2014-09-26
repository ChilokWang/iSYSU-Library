//
//  SLBookCell.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookCell.h"
#import "SLBookBaseModel.h"
#import "AsynImageView.h"

@implementation SLBookCell
@synthesize bookCover;
@synthesize name;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect coverFrame = CGRectMake(0, 0, 80, 100);
        CGRect nameFrame = CGRectMake(coverFrame.origin.x + coverFrame.size.width + 10,
                                      10, 200, 20);
        
        bookCover = [[AsynImageView alloc] initWithFrame:coverFrame];
        bookCover.backgroundColor = [UIColor blackColor];
        
        name = [[UILabel alloc] initWithFrame:nameFrame];
        name.backgroundColor = [UIColor clearColor];
        name.text = [NSString stringWithFormat:@"ios开发指南"];
        
        [self addSubview:bookCover];
        [self addSubview:name];
        
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithData:(SLBookBaseModel *)data
{
    self.bookCover.imageURL = data.bookCoverImageUrl;
    self.name.text = [NSString stringWithFormat:@"%@", data.bookName];
}

@end
