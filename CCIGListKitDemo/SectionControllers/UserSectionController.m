//
//  UserSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "UserSectionController.h"
#import "User.h"
#import "DetailLabelCell.h"

@interface UserSectionController ()

@property (nonatomic, strong) User *user;
@property (nonatomic) BOOL isReorderable;

@end

@implementation UserSectionController

- (instancetype) init : (BOOL) isReorderable {
    self = [super init];
    
    if (self) {
        self.isReorderable = isReorderable;
    }
    
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DetailLabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DetailLabelCell class] forSectionController:self atIndex:index];
    cell.titleLabel.text = self.user.name;
    cell.detailLabel.text = [NSString stringWithFormat:@"@%@", self.user.handle];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.user = object;
}

- (BOOL)canMoveItemAtIndex:(NSInteger)index {
    return self.isReorderable;
}

@end
