//
//  MTFetchedResultsControllerBasedItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTItemListCacheInterface.h"
#import "MTItemListCacheConstants.h"

@protocol MTFetchedResultsControllerBasedItemListCacheInterface <NSObject, MTItemListCacheInterface>

- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock;
- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock;
- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                          cacheName:(NSString*)cacheName
                        updateCache:(BOOL)updateCache
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock;

@end
