//
//  RemoveSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/30.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "RemoveSectionController.h"
#import "RemoveCell.h"

@interface RemoveSectionController () {
    NSNumber *number;
}

@end

@implementation RemoveSectionController

- (void) removeButtonHandle : (UIButton *) button {
    if ([_deleagte respondsToSelector:@selector(wantsRemoved:)]) {
        [_deleagte wantsRemoved:self];
    }
}

- (instancetype) init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 10, 0);
        number = @0;
    }
    
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RemoveCell *cell = [self.collectionContext dequeueReusableCellOfClass:[RemoveCell class] forSectionController:self atIndex:index];
    cell.label.text = [NSString stringWithFormat:@"Cell: %ld", [number integerValue] + 1];
    [cell.button addTarget:self action:@selector(removeButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    number = object;
}

@end
