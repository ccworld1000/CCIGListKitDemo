//
//  PersonSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "PersonSectionController.h"
#import "PersonModel.h"
#import "PersonCell.h"

@interface PersonSectionController ()

@property (nonatomic, strong) PersonModel *person;

@end

@implementation PersonSectionController

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 74.0);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    PersonCell *cell = [self.collectionContext dequeueReusableCellOfClass:[PersonCell class] forSectionController:self atIndex:index];
    cell.person = self.person;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.person = object;
}

@end
