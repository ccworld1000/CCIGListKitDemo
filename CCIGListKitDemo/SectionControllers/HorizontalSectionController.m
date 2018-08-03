//
//  HorizontalSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/3.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "HorizontalSectionController.h"
#import "EmbeddedSectionController.h"
#import "EmbeddedCollectionViewCell.h"

@interface HorizontalSectionController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic) NSInteger number;

@end

@implementation HorizontalSectionController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController];
        _adapter.dataSource = self;
    }
    
    return _adapter;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 100);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    EmbeddedCollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[EmbeddedCollectionViewCell class] forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.number = object;
}


- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (self.number) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity: self.number];
        for (int i = 0; i < self.number; i++) {
            [array addObject:@(i)];
        }
        
        return array;
    } else {
        return @[];
    }
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [EmbeddedSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end