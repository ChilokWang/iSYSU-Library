//
//  SLBorHistoryBook.h
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-7.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

@interface SLBorHistoryBook : SLBookBaseModel

@property (copy, nonatomic) NSString *borDate;
@property (copy, nonatomic) NSString *borTime;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
