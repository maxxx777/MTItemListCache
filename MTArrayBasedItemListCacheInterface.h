//
//  MTArrayBasedItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTItemListCacheInterface.h"
#import "MTItemListCacheConstants.h"

@protocol MTArrayBasedItemListCacheInterface <NSObject, MTItemListCacheInterface>

- (void)cacheItemListWithSourceObjects:(NSArray *)sourceObjects
                             predicate:(NSPredicate *)predicate
                            completion:(MTItemListCacheCompletionBlock)completionBlock;

@end
