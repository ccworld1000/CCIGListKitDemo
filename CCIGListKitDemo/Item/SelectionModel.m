//
//  SelectionModel.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "SelectionModel.h"

@implementation SelectionModel

- (instancetype)initWithOptions: (NSArray *)options type: (SelectionModelType) type {
    self = [super init];
    if (self) {
        self.options = options;
        self.type = type;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqual:object];
}

@end
