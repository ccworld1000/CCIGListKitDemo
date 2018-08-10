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

    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([_delegate respondsToSelector:@selector(searchSectionController:didChangeText:)]) {
        [_delegate searchSectionController:self didChangeText:searchText];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    if ([_delegate respondsToSelector:@selector(searchSectionController:didChangeText:)]) {
        [_delegate searchSectionController:self didChangeText:searchBar.text];
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter didScrollSectionController:(IGListSectionController *)sectionController {
    SearchCell *cell = [self.collectionContext cellForItemAtIndex:0 sectionController:sectionController];
    if (cell) {
        UISearchBar *searchBar = cell.searchBar;
        if (searchBar) {
            [searchBar resignFirstResponder];
        }
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter willBeginDraggingSectionController:(IGListSectionController *)sectionController {}
- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDraggingSectionController:(nonnull IGListSectionController *)sectionController willDecelerate:(BOOL)decelerate {}


@end
