//
//  SLBookCoverCell.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseCell.h"
@class AsynImageView;

@interface SLBookCoverCell : SLBookBaseCell
@property (weak, nonatomic) IBOutlet AsynImageView *bookCoverImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookPressLabel;

@end
