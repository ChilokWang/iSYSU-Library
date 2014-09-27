//
//  SLRestfulEngine.m
//  iSYSULibrary
//
//  Created by Alaysh on 14-9-18.
//  Copyright (c) 2014年 Alaysh. All rights reserved.
//

#import "SLRestfulEngine.h"
#import "SLBookBaseModel.h"
#import "SLBorHistoryBook.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#import "SLBorrowingBook.h"
#import "SLRecommendBook.h"
#import "SLAppointBook.h"

NSString * const HOST_URL = @"http://172.18.34.228:5000/api/";
NSString * const LOGIN_JSON = @"login.json";
NSString * const NEWBOOK_JSON = @"newBooks.json";
NSString * const BORLOANHISTORY_JSON = @"borLoanHistory.json";
NSString * const BORLOAN_JSON = @"borLoan.json";
NSString * const BORHOLD_JSON = @"borHold.json";
NSString * const BORRECOMMEND_JSON = @"borRecommend.json";
NSString * const SEARCHBOOK_JSON = @"findBook.json";
@implementation SLRestfulEngine

+ (BOOL)isConnectedToNetwork
{
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    
    struct sockaddr_storage zeroAddress;
    
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.ss_len = sizeof(zeroAddress);
    zeroAddress.ss_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    //获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        return NO;
    }
    //根据获得的连接标志进行判断
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable&&!needsConnection) ? YES : NO;
}

+ (void)httpRequestWithMethod: (NSString *)method action: (NSString *)action param: (NSString *)param onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    NSURL *url = nil;
    NSMutableURLRequest *urlRequest = nil;
    if ([method isEqualToString: @"POST"]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", HOST_URL, action]];
        urlRequest = [NSMutableURLRequest requestWithURL:url];
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:true]];
    }
    else if ([method isEqualToString:@"GET"]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@", HOST_URL, action, param]];
        urlRequest = [NSMutableURLRequest requestWithURL:url];
        [urlRequest setHTTPMethod:@"GET"];
    }
    else {
        
    }
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSURLSessionDataTask *dataTask =  [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            if (httpResp.statusCode == 200) {
                NSError *jsonError;
                NSDictionary *jsonDic =
                [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                if (!jsonError) {
                    succeedBlock(jsonDic);
                }
            }
            else {
                errorBlock(error);
            }
        }
        else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}

+ (void)loginWithName: (NSString *)username password: (NSString *)password onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    NSString *param = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    [self httpRequestWithMethod:@"GET" action:LOGIN_JSON param:param onSucceed:^(NSDictionary *resultDictionary) {
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(nil);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}

+ (void)loadNewBookWithPage: (int)page onSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    [self httpRequestWithMethod:@"GET" action:NEWBOOK_JSON param:@"" onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [NSMutableArray array];
        for (NSDictionary *dic in booksDic) {
            SLBookBaseModel *book = [[SLBookBaseModel alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}
+ (void)loadHotBookWithPage: (int)page onSucceed:(SucceedBlock)succeedBlock onError:(ErrorBlock)errorBlock
{

}

+ (void)searchBookWithKeyword: (NSString *)keyword type:(int)type page:(int)page onSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    NSString *param = [NSString stringWithFormat:@"kw=%@&type=%d", keyword, type];
    [self httpRequestWithMethod:@"GET" action:SEARCHBOOK_JSON param:param onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [[NSMutableArray alloc] init];
        for (NSDictionary * dic in booksDic) {
            SLBookBaseModel *book = [[SLBookBaseModel alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}

+ (void)loadMyLoanOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    [self httpRequestWithMethod:@"GET" action:BORLOAN_JSON param:@"" onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [NSMutableArray array];
        for (NSDictionary *dic in booksDic) {
            SLBorrowingBook *book = [[SLBorrowingBook alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}

+ (void)loadBorHoldOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    [self httpRequestWithMethod:@"GET" action:BORHOLD_JSON param:@"" onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [NSMutableArray array];
        for (NSDictionary *dic in booksDic) {
            SLAppointBook *book = [[SLAppointBook alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}

+ (void)loadBorRecommendOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    [self httpRequestWithMethod:@"GET" action:BORRECOMMEND_JSON param:@"" onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [NSMutableArray array];
        for (NSDictionary *dic in booksDic) {
            SLRecommendBook *book = [[SLRecommendBook alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorBlock(engineError);
        });
    }];
}

+ (void)loadLoanhistoryOnSucceed:(ArrayBlock)succeedBlock onError:(ErrorBlock)errorBlock
{
    [self httpRequestWithMethod:@"GET" action:BORLOANHISTORY_JSON param:@"" onSucceed:^(NSDictionary *resultDictionary) {
        NSArray *booksDic = resultDictionary[@"books"];
        NSMutableArray *books = [NSMutableArray array];
        for (NSDictionary *dic in booksDic) {
            SLBorHistoryBook *book = [[SLBorHistoryBook alloc] initWithDictionary:dic];
            [books addObject:book];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            succeedBlock(books);
        });
    } onError:^(NSError *engineError) {
        dispatch_async(dispatch_get_main_queue(), ^{
        errorBlock(engineError);
        });
    }];
}

@end
