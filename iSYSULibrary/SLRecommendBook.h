//
//  SLRecommendBook.h
//  iSYSULibrary
//
//  Created by kiros on 14-9-26.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLRecommendBook : NSObject

@property (copy, nonatomic) NSString *bookCoverImageUrl;
@property (copy, nonatomic) NSString *bookName;
@property (copy, nonatomic) NSString *bookId;
@property (copy, nonatomic) NSString *bookPress;
@property (copy, nonatomic) NSString *bookAuthor;
@property (copy, nonatomic) NSString *recDate;
@property (copy, nonatomic) NSString *reason;
@property (copy, nonatomic) NSString *proDate;
@property (copy, nonatomic) NSString *proStatus;
@property (copy, nonatomic) NSString *status;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;
@end
