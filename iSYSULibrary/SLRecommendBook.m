//
//  SLRecommendBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-25.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRecommendBook.h"
NSString * const kRecDate = @"recommendDate";
NSString * const kReason = @"recommendReason";
NSString * const kProDate = @"processingDate";
NSString * const kProStatus = @"processingStatus";
NSString * const kStatus = @"status";

@implementation SLRecommendBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.recDate = dictionary[kRecDate];
        self.reason = dictionary[kReason];
        self.proDate = dictionary[kProDate];
        self.proStatus = dictionary[kProStatus];
        self.status = dictionary[kStatus];
    }
    return self;
}
@end
