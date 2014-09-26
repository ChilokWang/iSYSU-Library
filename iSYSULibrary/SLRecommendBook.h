//
//  SLRecommendBook.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-25.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

@interface SLRecommendBook : SLBookBaseModel

@property (copy, nonatomic) NSString *recDate;
@property (copy, nonatomic) NSString *reason;
@property (copy, nonatomic) NSString *proDate;
@property (copy, nonatomic) NSString *proStatus;
@property (copy, nonatomic) NSString *status;

@end
