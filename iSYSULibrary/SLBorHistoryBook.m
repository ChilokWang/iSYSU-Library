//
//  SLBorHistoryBook.m
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-7.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorHistoryBook.h"

@implementation SLBorHistoryBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.borDate = dictionary[@"date"];
        self.borTime = dictionary[@"time"];
    }
    return self;
}

@end
