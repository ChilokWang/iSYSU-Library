//
//  SLBookBaseModel.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/6/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

@implementation SLBookBaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.bookCoverImageUrl = dictionary[@"bookCoverImageUrl"];
        self.bookName = dictionary[@"bookName"];
        self.bookId = dictionary[@"bookId"];
        self.bookAuthor = dictionary[@"bookAuthor"];
        self.bookPress = dictionary[@"bookPress"];
        self.brief = dictionary[@"brief"];
        self.distribution = dictionary[@"distribution"];
    }
    return self;
}

@end
