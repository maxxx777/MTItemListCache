//
//  MTArrayBasedItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTItemListCacheInterface.h"
#import "MTItemListCacheConstants.h"

@protocol MTArrayBasedItemListCacheInterface <NSObject, MTItemListCacheInterface>

- (void)cacheItemListWithSourceObjects:(NSArray * _Nonnull)sourceObjects
                             predicate:(NSPredicate * _Nullable)predicate
                            completion:(MTItemListCacheCompletionBlock)completionBlock;

@end
