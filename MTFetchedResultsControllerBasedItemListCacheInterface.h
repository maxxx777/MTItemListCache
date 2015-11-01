//
//  MTFetchedResultsControllerBasedItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 27.08.15.
//

#import "MTItemListCacheInterface.h"
#import "MTItemListCacheConstants.h"

@protocol MTFetchedResultsControllerBasedItemListCacheInterface <NSObject, MTItemListCacheInterface>

- (void)cacheItemListWithEntityName:(NSString * _Nonnull)entityName
                    sortDescriptors:(NSArray * _Nullable)sortDescriptors
                          predicate:(NSPredicate * _Nullable)predicate
                 sectionNameKeyPath:(NSString * _Nullable)sectionNameKeyPath
                            context:(NSManagedObjectContext * _Nonnull)context
                         completion:(MTItemListCacheCompletionBlock _Nullable)completionBlock;
- (void)cacheItemListWithEntityName:(NSString * _Nonnull)entityName
                    sortDescriptors:(NSArray * _Nullable)sortDescriptors
                          predicate:(NSPredicate * _Nullable)predicate
                 sectionNameKeyPath:(NSString * _Nullable)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                            context:(NSManagedObjectContext * _Nonnull)context
                         completion:(MTItemListCacheCompletionBlock _Nullable)completionBlock;
- (void)cacheItemListWithEntityName:(NSString * _Nonnull)entityName
                    sortDescriptors:(NSArray * _Nullable)sortDescriptors
                          predicate:(NSPredicate * _Nullable)predicate
                 sectionNameKeyPath:(NSString * _Nullable)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                          cacheName:(NSString * _Nullable)cacheName
                        updateCache:(BOOL)updateCache
                            context:(NSManagedObjectContext * _Nonnull)context
                         completion:(MTItemListCacheCompletionBlock _Nullable)completionBlock;

@end
