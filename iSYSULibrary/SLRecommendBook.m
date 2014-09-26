//
//  SLRecommendBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendBook.h"

NSString * const kName = @"bookName";
NSString * const kId = @"bookId";
NSString * const kAuthor = @"bookAuthor";
NSString * const kPress = @"bookPress";
NSString * const kRecDate = @"recommendDate";
NSString * const kReason = @"recommendReason";
NSString * const kProDate = @"processingDate";
NSString * const kProStatus = @"processingStatus";
NSString * const kStatus = @"status";

@implementation SLRecommendBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        self.bookName = dictionary[kName];
        self.bookId = dictionary[kId];
        self.bookPress = dictionary[kPress];
        self.bookAuthor = dictionary[kAuthor];
        self.recDate = dictionary[kRecDate];
        self.reason = dictionary[kReason];
        self.proDate = dictionary[kProDate];
        self.proStatus = dictionary[kProStatus];
        self.status = dictionary[kStatus];
    }
    return self;
}
@end