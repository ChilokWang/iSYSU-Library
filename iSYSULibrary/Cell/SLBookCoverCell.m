//
//  SLBookCoverCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookCoverCell.h"

@implementation SLBookCoverCell

- (id)initWithFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width += 20;
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SLBookCoverCell" owner:self options:nil];
        self = (SLBookCoverCell *)[nib objectAtIndex:0];
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
    self.bookCoverImageView.image = [UIImage imageNamed:dic[@"bookCoverImageUrl"]];
    self.bookAuthorLabel.text = dic[@"bookAuthor"];
    self.bookIdLabel.text = dic[@"bookId"];
    self.bookAuthorLabel.text = dic[@"bookAuthor"];
    self.bookPressLabel.text = dic[@"bookPress"];
}

@end
