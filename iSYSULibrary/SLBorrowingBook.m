//
//  SLBorrowingBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowingBook.h"

@implementation SLBorrowingBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.borDate = dictionary[@"borDate"];
        self.retDate = dictionary[@"retDate"];
    }
    return self;
}

@end
