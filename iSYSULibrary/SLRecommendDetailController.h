//
//  SLRecommendDetailController.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLRecDetailLabel;

@interface SLRecommendDetailController : UIViewController

@property (strong, nonatomic) UIView *detailView;

@property (strong, nonatomic) SLRecDetailLabel *bookName;
@property (strong, nonatomic) SLRecDetailLabel *bookId;
@property (strong, nonatomic) SLRecDetailLabel *bookAuthor;
@property (strong, nonatomic) SLRecDetailLabel *bookPress;
@property (strong, nonatomic) SLRecDetailLabel *recDate;
@property (strong, nonatomic) SLRecDetailLabel *recReason;
@property (strong, nonatomic) SLRecDetailLabel *proDate;
@property (strong, nonatomic) SLRecDetailLabel *proStatus;
@property (strong, nonatomic) SLRecDetailLabel *status;

- (void)configureViewsWithDictionary:(NSDictionary *)dic;

@end
