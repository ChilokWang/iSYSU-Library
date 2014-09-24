//
//  SLBorHistoryBook.m
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-7.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLBorHistoryBook.h"

//NSString * const kBookCoverImageUrl = @"bookCoverImageUrl";
//NSString * const kBookName = @"bookName";
//NSString * const kBookId = @"bookId";
//NSString * const kBookAuthor = @"bookAuthor";
//NSString * const kBookPress = @"bookPress";
//NSString * const kBrief = @"brief";
//NSString * const kDistribution = @"distribution";
NSString * const kDate = @"date";
NSString * const kTime = @"time";

@implementation SLBorHistoryBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.borDate = dictionary[kDate];
        self.borTime = dictionary[kTime];
    }
    return self;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.borDate = [aDecoder decodeObjectForKey:kDate];
    self.borTime = [aDecoder decodeObjectForKey:kTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.borDate forKey:kDate];
    [aCoder encodeObject:self.borTime forKey:kTime];
}
@end
