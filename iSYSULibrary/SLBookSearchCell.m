//
//  SLBookSearchCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 24/9/14.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookSearchCell.h"
#import "SLBookBaseModel.h"
#import "AsynImageView.h"

@implementation SLBookSearchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithBook: (SLBookBaseModel *)book
{
    self.bookCoverImageVIew.imageURL = book.bookCoverImageUrl;
    self.bookNameLabel.text = book.bookName;
    self.bookAuthorLabel.text = book.bookAuthor;
}
@end
