//
//  GridSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "GridSectionController.h"
#import "CenterLabelCell.h"
#import "GridItem.h"

@interface GridSectionController()

@property (nonatomic, strong) GridItem *object;
@property (nonatomic) BOOL isReorderable;

@end

@implementation GridSectionController

- (instancetype) init : (BOOL) isReorderable {
    self = [super init];
    
    if (self) {
        self.isReorderable = isReorderable;
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing =1;
    }
    
    return self;
}

- (NSInteger)numberOfItems {
    return  self.object.itemCount;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floor(width / 4.0);
    
    return CGSizeMake(itemSize, itemSize);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[CenterLabelCell class] forSectionController:self atIndex:index];
    cell.label.text = self.object.items[index];
    cell.backgroundColor = self.object.color;
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.object = object;
}

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
    return self.isReorderable;
}

- (void)moveObjectFromIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex {
    if (self.object) {
        id item = [self.object.items objectAtIndex:sourceIndex];
        [self.object.items removeObject:item];
        [self.object.items insertObject:item atIndex:destinationIndex];
    }
}

@end
