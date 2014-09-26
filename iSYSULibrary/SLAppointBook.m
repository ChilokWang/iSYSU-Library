//
//  SLAppointBook.m
//  iSYSULibrary
//
//  Created by kiros on 14-9-25.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLAppointBook.h"

NSString * const kValDate = @"validDate";
NSString * const kMeetDate = @"meetDate";
NSString * const kReqStatus = @"requestStatus";
NSString * const kReqNum = @"requestNum";
NSString * const kPlace = @"";

@implementation SLAppointBook

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.validDate = dictionary[kValDate];
        self.meetDate = dictionary[kMeetDate];
        self.reqStatus = dictionary[kReqStatus];
        self.reqNum = dictionary[kReqNum];
    }
    return self;
}

@end
