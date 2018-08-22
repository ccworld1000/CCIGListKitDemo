//
//  FeedItemSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/22.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "FeedItemSectionController.h"
#import "FeedItem.h"
#import "UserHeaderView.h"
#import "UserFooterView.h"
#import "LabelCell.h"

@interface FeedItemSectionController() <IGListSupplementaryViewSource>

@property (nonatomic, strong) FeedItem *feedItem;

@end

@implementation FeedItemSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.feedItem.comments.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    
    cell.text = self.feedItem.comments[index];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.feedItem = object;
}

- (NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader, UICollectionElementKindSectionFooter];
}

- (__kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind
                                                                 atIndex:(NSInteger)index {
    UICollectionReusableView *view = nil;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        UserHeaderView *heaer = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                  forSectionController:self
                                                               nibName:@"UserHeaderView"
                                                                bundle:nil
                                                               atIndex:index];
        heaer.nameLabel.text = self.feedItem.user.name;
        heaer.handleLabel.text = [NSString stringWithFormat:@"@%@", self.feedItem.user.handle];
        view = heaer;
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        UserFooterView *footer = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                  forSectionController:self
                                                               nibName:@"UserFooterView"
                                                                bundle:nil
                                                               atIndex:index];
        footer.commentsCountLabel.text = [NSString stringWithFormat:@"%ld", self.feedItem.comments.count];
        view = footer;
        
    }
    
    return view;
}


- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind
                                 atIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 40);
}

@end
