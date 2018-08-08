//
//  SearchSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/8.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SearchSectionController.h"
#import "SearchCell.h"

@interface SearchSectionController () <UISearchBarDelegate, IGListScrollDelegate>



@end

@implementation SearchSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDelegate = self;
    }
    
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 44);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    SearchCell *cell = [self.collectionContext dequeueReusableCellOfClass:[SearchCell class]
                                                     forSectionController:self
                                                                  atIndex:index];
    
    cell.searchBar.delegate = self;
    
//    UISearchBar *searchBar = cell.searchBar;
//    [searchBar resignFirstResponder];
    
    return cell;
}

@end
