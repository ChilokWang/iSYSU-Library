//
//  SLRecommendBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendBook.h"

NSString * const kCoverImageUrl = @"bookCoverImageUrl";
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

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.bookName = [aDecoder decodeObjectForKey:kName];
    self.bookId = [aDecoder decodeObjectForKey:kId];
    self.bookAuthor = [aDecoder decodeObjectForKey:kAuthor];
    self.bookPress = [aDecoder decodeObjectForKey:kPress];
    self.recDate = [aDecoder decodeObjectForKey:kRecDate];
    self.reason = [aDecoder decodeObjectForKey:kReason];
    self.proDate = [aDecoder decodeObjectForKey:kProDate];
    self.proStatus = [aDecoder decodeObjectForKey:kProStatus];
    self.status = [aDecoder decodeObjectForKey:kStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.bookName forKey:kName];
    [aCoder encodeObject:self.bookId forKey:kId];
    [aCoder encodeObject:self.bookAuthor forKey:kAuthor];
    [aCoder encodeObject:self.bookPress forKey:kPress];
    [aCoder encodeObject:self.recDate forKey:kRecDate];
    [aCoder encodeObject:self.reason forKey:kReason];
    [aCoder encodeObject:self.proDate forKey:kProDate];
    [aCoder encodeObject:self.proStatus forKey:kProStatus];
    [aCoder encodeObject:self.status forKey:kStatus];
}
@end