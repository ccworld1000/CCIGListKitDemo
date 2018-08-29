//
//  DisplaySectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/24 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "DisplaySectionController.h"
#import "LabelCell.h"

@interface DisplaySectionController() <IGListDisplayDelegate>

@end

@implementation DisplaySectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 30, 0);
        self.displayDelegate = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 4;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.text = [NSString stringWithFormat:@"Section %ld, cell %ld", self.section, index];
    return cell;
}


- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController {
    printf("Will display section %ld\n", self.section);
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController {
    printf("Did end displaying section %ld\n", self.section);
}

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController
               cell:(UICollectionViewCell *)cell
            atIndex:(NSInteger)index {
    printf("Did will display cell %ld in section %ld\n", index, self.section);
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController
               cell:(UICollectionViewCell *)cell
            atIndex:(NSInteger)index {
    printf("Did end displaying cell %ld in section %ld\n", index, self.section);
}

@end
