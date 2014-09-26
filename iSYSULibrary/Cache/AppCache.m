#import "AppCache.h"

@implementation AppCache
+ (void)clearCache
{
    NSString *path = [AppCache cacheDirectory];
    NSFileManager *fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:path])
    {
        [fm removeItemAtPath:path error:nil];
    }
    [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

+(NSString*) cacheDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    return [cachesDirectory stringByAppendingPathComponent:@"Cache"];
}

+ (void)cacheItems:(NSArray *)items toPath:(NSString *)pathComponent
{
    NSString *path = [[AppCache cacheDirectory] stringByAppendingPathComponent:pathComponent];
    [[NSKeyedArchiver archivedDataWithRootObject:items] writeToFile:path atomically:true];
}

+ (NSArray *)getCachedItemsWithPath:(NSString *)pathComponent
{
    NSString *path = [[AppCache cacheDirectory] stringByAppendingPathComponent:pathComponent];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *items = nil;
    if (data) {
        items = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return items;
}

+ (void)cacheNewBooks:(NSArray *)books
{
    [AppCache cacheItems:books toPath:@"newBooks"];
}

+ (NSArray *)getCachedNewBooks
{
    return [AppCache getCachedItemsWithPath:@"newBooks"];
}

+ (void)cacheHistoryBooks:(NSArray *)books
{
    [AppCache cacheItems:books toPath:@"historyBooks"];
}

+ (NSArray *)getCachedHistoryBooks
{
    return [AppCache getCachedItemsWithPath:@"historyBooks"];
}
@end