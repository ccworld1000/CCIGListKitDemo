//
//  StoryboardLabelSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "StoryboardLabelSectionController.h"
#import "Person.h"
#import "StoryboardCell.h"

@interface StoryboardLabelSectionController()

@property (nonatomic, strong) Person *object;

@end

@implementation StoryboardLabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.object.name.length * 7, self.object.name.length * 7);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    StoryboardCell *cell = [self.collectionContext dequeueReusableCellFromStoryboardWithIdentifier:@"cell" forSectionController:self atIndex:index];
    cell.textLabel.text = self.object.name;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(removeSectionControllerWantsRemoved:)]) {
        [self.delegate removeSectionControllerWantsRemoved:self];
    }
}

@end
