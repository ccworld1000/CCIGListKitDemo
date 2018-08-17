//
//  ExpandableSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "ExpandableSectionController.h"
#import "LabelCell.h"

@interface ExpandableSectionController()

@property (nonatomic) BOOL expanded;
@property (nonatomic, copy) NSString *object;

@end

@implementation ExpandableSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = [LabelCell singleLineHeight];
    
    if (self.expanded) {
        height = [LabelCell textHeight:self.object width:width];
    }
    
    return CGSizeMake(width, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.text = self.object;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    _expanded = !_expanded;
    
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.6
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         [weakself.collectionContext invalidateLayoutForSectionController:self completion:nil];
                     } completion:nil];
}

@end
