//
//  SLBorrowingBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-24.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorrowingBook.h"

@implementation SLBorrowingBook

+ (instancetype)bookWithDictionary:(NSDictionary *)dictionary
{
    SLBorrowingBook *book = [super bookWithDictionary:dictionary];
    book.borDate = dictionary[@"borDate"];
    book.retDate = dictionary[@"retDate"];
    
    return book;
}

@end
