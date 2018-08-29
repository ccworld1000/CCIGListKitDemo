//
//  SearchCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/8 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "SearchCell.h"

@implementation SearchCell

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        [self.contentView addSubview:_searchBar];
    }
    
    return _searchBar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.searchBar.frame = self.contentView.bounds;
}

@end
