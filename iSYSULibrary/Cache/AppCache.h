#import <Foundation/Foundation.h>

@interface AppCache : NSObject

+ (void)clearCache;
+ (void)cacheNewBooks:(NSArray *)books;
+ (NSArray *)getCachedNewBooks;
+ (void)cacheHistoryBooks:(NSArray *)books;
+ (NSArray *)getCachedHistoryBooks;
@end