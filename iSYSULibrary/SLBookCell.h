//
//  SLBookCell.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLBookBaseModel;
@class AsynImageView;

@interface SLBookCell : UITableViewCell

@property (strong, nonatomic) AsynImageView *bookCover;      /* 书的封面 */
@property (strong, nonatomic) UILabel *name;           /* 书名 */

- (void)configureWithData:(SLBookBaseModel *)data;

@end
