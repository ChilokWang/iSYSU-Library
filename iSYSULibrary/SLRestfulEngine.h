//
//  SLRestfulEngine.h
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-18.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VoidBlock)(void);
typedef void (^ArrayBlock)(NSMutableArray* resultArray);
typedef void (^SucceedBlock)(NSDictionary *resultDictionary);
typedef void (^ErrorBlock)(NSError* engineError);

@interface SLRestfulEngine : NSObject

+ (void)loginWithName: (NSString *)username password: (NSString *)password onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadNewBookWithPage: (int)page onSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadHotBookWithPage: (int)page onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)searchBookWithKeyword: (NSString *)keyword type:(int)type page:(int)page onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadMyLoanOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadBorHoldOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadBorRecommendOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock;
+ (void)loadLoanhistoryOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock;

@end
