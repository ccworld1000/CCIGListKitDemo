//
//  LabelSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/27.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "LabelSectionController.h"
#import "LabelCell.h"

@interface LabelSectionController ()

@property (nonatomic, strong) DemoItem *item;

@end

@implementation LabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.text = self.item.name;
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

@end
