#import <Foundation/Foundation.h>

@interface AppCache : NSObject

+ (void)clearCache;
+ (void)cacheNewBooks:(NSArray *)books;
+ (NSArray *)getCachedNewBooks;
+ (void)cacheHistoryBooks:(NSArray *)books;
+ (NSArray *)getCachedHistoryBooks;
+ (void)cacheMyLoanBooks:(NSArray *)books;
+ (NSArray *)getCachedMyLoanBooks;
+ (void)cacheAppointBooks:(NSArray *)books;
+ (NSArray *)getCachedAppointBooks;
+ (void)cacheRecommendBooks:(NSArray *)books;
+ (NSArray *)getCachedRecommendBooks;
@end