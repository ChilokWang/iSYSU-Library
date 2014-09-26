//
//  SLBorrowingBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowingBook.h"
NSString * const kBorDate = @"date";
NSString * const kRetDate = @"retDate";

@implementation SLBorrowingBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.borDate = dictionary[kBorDate];
        self.retDate = dictionary[kRetDate];
    }
    return self;
}

@end
