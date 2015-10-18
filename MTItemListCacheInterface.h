//
//  MTItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import <Foundation/Foundation.h>

@protocol MTItemListCacheInterface <NSObject>

- (NSArray *)allCachedItems;
- (NSUInteger)numberOfAllCachedItems;

- (id)objectAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSIndexPath *)indexPathForObject:(id _Nonnull)object;

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;

- (NSArray *)sectionIndexTitles;
- (NSString *)sectionIndexTitleForSectionName:(NSString * _Nullable)sectionName;

- (NSString *)titleForHeaderInSection:(NSInteger)section;

@end
