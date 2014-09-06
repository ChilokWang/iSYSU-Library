//
//  SLBookBaseModel.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/6/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

@implementation SLBookBaseModel

+ (instancetype)bookWithDictionary:(NSDictionary *)dictionary;
{
    SLBookBaseModel *book = [self init];
    book.bookCoverImageUrl = dictionary[@"bookCoverImageUrl"];
    book.bookName = dictionary[@"bookName"];
    book.bookId = dictionary[@"bookId"];
    book.bookAuthor = dictionary[@"bookAuthor"];
    book.bookPress = dictionary[@"bookPress"];
    book.brief = dictionary[@"brief"];
    book.distribution = dictionary[@"distribution"];
    
    return book;
}


@end
