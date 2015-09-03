//
//  MTFetchedResultsControllerBasedItemListCache.h
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import "MTFetchedResultsControllerBasedItemListCacheInterface.h"

@protocol MTItemListCacheDelegate;

@interface MTFetchedResultsControllerBasedItemListCache : NSObject
<
    MTFetchedResultsControllerBasedItemListCacheInterface,
    NSFetchedResultsControllerDelegate
>

- (instancetype)initWithDelegate:(id<MTItemListCacheDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@end
