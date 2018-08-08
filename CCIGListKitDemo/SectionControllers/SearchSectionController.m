//
//  SearchSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/8.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SearchSectionController.h"

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



@end
