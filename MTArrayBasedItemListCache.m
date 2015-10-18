//
//  MTArrayBasedItemListCache.m
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import "MTArrayBasedItemListCache.h"

@interface MTArrayBasedItemListCache ()

@property (nonatomic, strong) NSArray *fetchedResults;

@end

@implementation MTArrayBasedItemListCache

- (void)dealloc
{
    DLog(@"%@ deallocated: %p", NSStringFromClass([self class]), self);
}

#pragma mark - MTArrayBasedItemListCacheInterface

- (void)cacheItemListWithSourceObjects:(NSArray *)sourceObjects
                             predicate:(NSPredicate *)predicate
                            completion:(MTItemListCacheCompletionBlock)completionBlock
{
    BOOL success = YES;
    
    @try {
        if (predicate == nil) {
            predicate = [NSPredicate predicateWithValue:YES];
        }
        self.fetchedResults = [NSArray arrayWithArray:[sourceObjects filteredArrayUsingPredicate:predicate]];
    }
    @catch (NSException *exception) {
        DLog(@"%@", exception);
        success = NO;
    }
    @finally {
        if (!success) {
            //FIXME: configure NSError (cache items error)
        }
        
        if (completionBlock) {
            completionBlock(nil, nil);
        }
    }
}

#pragma mark - MTItemListCacheInterface

- (NSArray *)allCachedItems
{
    return self.fetchedResults;
}

- (NSUInteger)numberOfAllCachedItems
{
    return [self.fetchedResults count];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.fetchedResults)[indexPath.row];
}

- (NSIndexPath *)indexPathForObject:(id)object
{
    return [NSIndexPath indexPathForRow:[self.fetchedResults indexOfObject:object] inSection:0];
}

- (NSUInteger)numberOfSections
{
    return 1;
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section
{
    return [self.fetchedResults count];
}

- (NSArray *)sectionIndexTitles
{
    return nil;
}

- (NSString *)sectionIndexTitleForSectionName:(NSString *)sectionName
{
    return @"";
}

- (NSString *)titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

@end
