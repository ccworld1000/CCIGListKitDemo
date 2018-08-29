//
//  EmbeddedSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/3 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "EmbeddedSectionController.h"
#import "CenterLabelCell.h"

@interface EmbeddedSectionController()

@property (nonatomic, strong) NSNumber *number;

@end

@implementation EmbeddedSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 0, 10);
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat height = self.collectionContext.containerSize.height;
    return CGSizeMake(height, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index; {
    CenterLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[CenterLabelCell class]
                                                                     forSectionController:self
                                                                                  atIndex:index];
    cell.label.text = [NSString stringWithFormat:@"%ld", [self.number integerValue] + 1];
    cell.backgroundColor = [CCColor colorWithRed:237 / 255.0 green:73 / 255.0 blue:86 / 255.0 alpha:1];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.number = object;
}

@end
