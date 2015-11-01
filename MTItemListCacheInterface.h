//
//  MTItemListCacheInterface.h
//
//  Created by MAXIM TSVETKOV on 29.05.15.
//

#import <Foundation/Foundation.h>

@protocol MTItemListCacheInterface <NSObject>

- (NSArray * _Nullable)allCachedItems;
- (NSUInteger)numberOfAllCachedItems;

- (id _Nullable)objectAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSIndexPath * _Nullable)indexPathForObject:(id _Nonnull)object;

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;

- (NSArray * _Nullable)sectionIndexTitles;
- (NSString * _Nullable)sectionIndexTitleForSectionName:(NSString * _Nullable)sectionName;

- (NSString * _Nullable)titleForHeaderInSection:(NSInteger)section;

@end
