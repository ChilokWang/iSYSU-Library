//
//  SLBorHistoryBook.m
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-7.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorHistoryBook.h"

@implementation SLBorHistoryBook

+ (instancetype)bookWithDictionary:(NSDictionary *)dictionary;
{
    SLBorHistoryBook *book = [super bookWithDictionary:dictionary];
    book.borDate = dictionary[@"borDate"];
    book.borTime = dictionary[@"borTime"];
    
    return book;
}

@end
