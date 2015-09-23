MTItemListCache
====================

These classes cache lists of objects.

Overview
====================

These classes can cache lists of objects in two ways: **MTArrayBasedItemListCache** or **MTFetchedResultsControllerBasedItemListCache**.
- MTArrayBasedItemListCache cache lists using `NSArray` (it can be used for search results);
- MTFetchedResultsControllerBasedItemListCache cache lists using `NSFetchedResultsController` (it can be used for fetch data from data storage).

It is convenient to use **MTItemListCacheInterface.h** with `UICollectionViewDataSource` or `UITableViewDataSource`.

**MTItemListCacheDelegate.h** enables to subscribe for change content of `NSFetchedResultsController` (it can be used only with **MTFetchedResultsControllerBasedItemListCache**).

**Usage**

Copy files from repository into your project and include `MTArrayBasedItemListCache.h` or `MTFetchedResultsControllerBasedItemListCache.h`.

**Description**

*MTItemListCacheInterface.h*

```objective-c
- (NSArray *)allCachedItems
```

returns array of all cached objects

```objective-c
- (NSUInteger)numberOfAllCachedItems
```

returns number of all cached objects

```objective-c
- (id)objectAtIndexPath:(NSIndexPath *)indexPath
```

returns cached object at given index path

```objective-c
- (NSIndexPath *)indexPathForObject:(id)object
```

returns index path for given cached object

```objective-c
- (NSUInteger)numberOfSections
```

returns number of sections in the list of cached objects

```objective-c
- (NSUInteger)numberOfRowsInSection:(NSInteger)section
```

returns number of rows in given section of the list of cached objects

```objective-c
- (NSArray *)sectionIndexTitles
```

return array of section index titles of the list of cached objects

```objective-c
- (NSString *)sectionIndexTitleForSectionName:(NSString *)sectionName
```

return section index title for given section name in the list of cached objects

```objective-c
- (NSString *)titleForHeaderInSection:(NSInteger)section
``` 

return header title for given section in the list of cached objects

*MTArrayBasedItemListCacheInterface.h*

```objective-c
- (void)cacheItemListWithSourceObjects:(NSArray *)sourceObjects
                             predicate:(NSPredicate *)predicate
                            completion:(MTItemListCacheCompletionBlock)completionBlock
```

cache given objects with predicate and comletion handler block

*MTFetchedResultsControllerBasedItemListCacheInterface.h*

```objective-c
- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
```

cache objects with given entity name, sorted descriptors, predicate, section name key path, context and comletion handler block

```objective-c
- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
```

cache objects with given entity name, sorted descriptors, predicate, section name key path, include/not include subentities, context and comletion handler block

```objective-c
- (void)cacheItemListWithEntityName:(NSString *)entityName
                    sortDescriptors:(NSArray *)sortDescriptors
                          predicate:(NSPredicate *)predicate
                 sectionNameKeyPath:(NSString *)sectionNameKeyPath
                includesSubentities:(BOOL)includesSubentities
                          cacheName:(NSString*)cacheName
                        updateCache:(BOOL)updateCache
                            context:(NSManagedObjectContext *)context
                         completion:(MTItemListCacheCompletionBlock)completionBlock
```

cache objects with given entity name, sorted descriptors, predicate, section name key path, include/not include subentities, cache name, update/not update cache, context and comletion handler block

*MTItemListCacheDelegate.h*

```objective-c
- (void)onDidChangeContent
```

returns when content of `NSFetchedResultsController` was changed

Demo
====================

These clasess are used in [this demo app](https://github.com/maxxx777/MTVIPERDemoApp).
