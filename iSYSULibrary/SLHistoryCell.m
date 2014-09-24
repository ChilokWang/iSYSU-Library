//
//  SLHistoryCell.m
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-18.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLHistoryCell.h"
#import "SLBorHistoryBook.h"

@implementation SLHistoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithBook:(SLBorHistoryBook *)book
{
    self.bookNameLabel.text = book.bookName;
    self.bookAuthorLabel.text = book.bookAuthor;
    self.borDateLabel.text = book.borDate;
    self.borTimeLabel.text = book.borTime;
    NSLog(@"bookName:%@ bookAuthor:%@ date:%@ time:%@", book.bookName, book.bookAuthor, book.borDate, book.borTime);
}
@end
