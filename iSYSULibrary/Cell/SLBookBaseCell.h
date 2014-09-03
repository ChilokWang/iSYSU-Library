//
//  SLBookBaseCell.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/3/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, InfoTitle) {
    BookCoverInfo,
    BookBriefInfo,
    BookDistributionInfo
};

@interface SLBookBaseCell : UITableViewCell

+ (instancetype)TableCellWithInfoTitle:(InfoTitle)title;
- (void)configureWithDictionary:(NSDictionary *)dic;

@end
