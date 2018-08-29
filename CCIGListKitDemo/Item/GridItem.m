//
//  GridItem.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "GridItem.h"

@implementation GridItem

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

- (NSMutableArray *) computeItems {
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:self.itemCount];
    for (int i = 1; i <= self.itemCount; i++) {
        [list addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    return list;
}

- (instancetype)initWithColor : (CCColor *) color itemCount: (NSInteger) count {
    self = [super init];
    if (self) {
        self.color = color;
        self.itemCount = count;
        self.items = [self computeItems];
    }
    
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return ((self == object) || ([self isEqual:object]));
}


@end
