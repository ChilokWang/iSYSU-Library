//
//  SLBookBaseModel.h
//  iSYSULibrary
//
//  Created by Alaysh on 9/6/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLBookBaseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)bookWithDictionary:(NSDictionary *)dictionary;

@property (copy, nonatomic) NSString *bookCoverImageUrl;
@property (copy, nonatomic) NSString *bookName;
@property (copy, nonatomic) NSString *bookId;
@property (copy, nonatomic) NSString *bookAuthor;
@property (copy, nonatomic) NSString *bookPress;
@property (copy, nonatomic) NSString *brief;
@property (copy, nonatomic) NSArray *distribution;

@end
