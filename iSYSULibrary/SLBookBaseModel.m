//
//  SLBookBaseModel.m
//  iSYSULibrary
//
//  Created by Alaysh on 9/6/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import "SLBookBaseModel.h"

NSString * const kBookCoverImageUrl = @"bookCoverImageUrl";
NSString * const kBookName = @"bookName";
NSString * const kBookId = @"bookId";
NSString * const kBookAuthor = @"bookAuthor";
NSString * const kBookPress = @"bookPress";
NSString * const kBrief = @"brief";
NSString * const kDistribution = @"distribution";

@implementation SLBookBaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.bookCoverImageUrl = dictionary[kBookCoverImageUrl];
        self.bookName = dictionary[kBookName];
        self.bookId = dictionary[kBookId];
        self.bookAuthor = dictionary[kBookAuthor];
        self.bookPress = dictionary[kBookPress];
        self.brief = dictionary[kBrief];
        self.distribution = dictionary[kDistribution];
    }
    return self;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.bookCoverImageUrl = [aDecoder decodeObjectForKey:kBookCoverImageUrl];
    self.bookName = [aDecoder decodeObjectForKey:kBookName];
    self.bookId = [aDecoder decodeObjectForKey:kBookId];
    self.bookAuthor = [aDecoder decodeObjectForKey:kBookAuthor];
    self.bookPress = [aDecoder decodeObjectForKey:kBookPress];
    self.brief = [aDecoder decodeObjectForKey:kBrief];
    self.distribution = [aDecoder decodeObjectForKey:kDistribution];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.bookCoverImageUrl forKey:kBookCoverImageUrl];
    [aCoder encodeObject:self.bookName forKey:kBookName];
    [aCoder encodeObject:self.bookId forKey:kBookId];
    [aCoder encodeObject:self.bookAuthor forKey:kBookAuthor];
    [aCoder encodeObject:self.bookPress forKey:kBookPress];
    [aCoder encodeObject:self.brief forKey:kBrief];
    [aCoder encodeObject:self.distribution forKey:kDistribution];
}
@end
