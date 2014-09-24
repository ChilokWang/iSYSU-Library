//
//  SLBookSearchCell.h
//  iSYSULibrary
//
//  Created by Alaysh on 24/9/14.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBookBaseModel;
@class AsynImageView;

@interface SLBookSearchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet AsynImageView *bookCoverImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;

- (void)configureWithBook: (SLBookBaseModel *)book;
@end
