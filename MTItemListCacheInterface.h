//
//  MTItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import <Foundation/Foundation.h>

@protocol MTItemListCacheInterface <NSObject>

- (NSArray *)allCachedItems;
- (NSUInteger)numberOfAllCachedItems;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathForObject:(id)object;

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;

- (NSArray *)sectionIndexTitles;
- (NSString *)sectionIndexTitleForSectionName:(NSString *)sectionName;

- (NSString *)titleForHeaderInSection:(NSInteger)section;

@end
