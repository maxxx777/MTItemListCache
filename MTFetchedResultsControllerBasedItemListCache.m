//
//  MTFetchedResultsControllerBasedItemListCache.m
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import "MTFetchedResultsControllerBasedItemListCache.h"
#import "MTItemListCacheDelegate.h"

@interface MTFetchedResultsControllerBasedItemListCache ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) id<MTItemListCacheDelegate>delegate;

@end

@implementation MTFetchedResultsControllerBasedItemListCache

- (instancetype)initWithDelegate:(id<MTItemListCacheDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        
    }
    return self;
}

- (instancetype)init
{
    return [self initWithDelegate:nil];
}

- (void)dealloc
{
    DLog(@"%@ deallocated: %p", NSStringFromClass([self class]), self);
}

#pragma mark - MTFetchedResultsControllerBasedItemListCacheInterface

- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
{
    return [self cacheItemListWithEntityName:entityName
                             sortDescriptors:sortDescriptors
                                   predicate:predicate
                          sectionNameKeyPath:sectionNameKeyPath
                         includesSubentities:YES
                                   cacheName:nil
                                 updateCache:NO
                                     context:context
                                  completion:completionBlock];
}

- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
{
    return [self cacheItemListWithEntityName:entityName
                             sortDescriptors:sortDescriptors
                                   predicate:predicate
                          sectionNameKeyPath:sectionNameKeyPath
                         includesSubentities:includesSubentities
                                   cacheName:nil
                                 updateCache:NO
                                     context:context
                                  completion:completionBlock];
}

- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                          cacheName:(NSString*)cacheName
                        updateCache:(BOOL)updateCache
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
{
    BOOL success = YES;
    
    @try {
        
        if (updateCache) {
            if (cacheName) {
                [NSFetchedResultsController deleteCacheWithName:cacheName];
            }
        }
        
        _fetchedResultsController.delegate = nil;
        _fetchedResultsController = nil;
        
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName
                                                      inManagedObjectContext:context];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        
        if (predicate != nil) {
            [request setPredicate:predicate];
        }
        
        if (sortDescriptors != nil) {
            [request setSortDescriptors:sortDescriptors];
        }
        
        [request setIncludesSubentities:includesSubentities];
        
        NSFetchedResultsController *theFetchedResultsController =
        [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                            managedObjectContext:context
                                              sectionNameKeyPath:sectionNameKeyPath
                                                       cacheName:cacheName];
        theFetchedResultsController.delegate = self;
        self.fetchedResultsController = theFetchedResultsController;
        
        NSError *error = nil;
        if (![self.fetchedResultsController performFetch:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            DLog(@"%@", error);
            abort();
        }
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
    return self.fetchedResultsController.fetchedObjects;
}

- (NSUInteger)numberOfAllCachedItems
{
    return [self.fetchedResultsController.fetchedObjects count];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (NSIndexPath *)indexPathForObject:(id)object
{
    return [self.fetchedResultsController indexPathForObject:object];
}

- (NSUInteger)numberOfSections
{
    return self.fetchedResultsController.sections.count;
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *sections = [self.fetchedResultsController sections];
    id <NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    return sectionInfo.numberOfObjects;
}

- (NSString*)sectionIndexTitleForSectionName:(NSString *)sectionName
{
    return [self.fetchedResultsController sectionIndexTitleForSectionName:sectionName];
}

- (NSArray *)sectionIndexTitles
{
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSString *)titleForHeaderInSection:(NSInteger)section
{
    NSArray *sections = [self.fetchedResultsController sections];
    id <NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    return [sectionInfo name];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (NSString *)controller:(NSFetchedResultsController *)controller sectionIndexTitleForSectionName:(NSString *)sectionName
{
    return sectionName;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDidChangeContent)]) {
        [self.delegate onDidChangeContent];
    }
}

@end
