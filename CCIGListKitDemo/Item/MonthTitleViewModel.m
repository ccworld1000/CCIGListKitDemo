//
//  MonthTitleViewModel.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/13.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "MonthTitleViewModel.h"

@interface MonthTitleViewModel()

@property (nonatomic, strong) NSString *name;

@end

@implementation MonthTitleViewModel

- (instancetype)initWithName : (NSString *) name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return _name;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    
    MonthTitleViewModel *item = (MonthTitleViewModel *)object;
    
    if ([item isKindOfClass:[MonthTitleViewModel class]]) {
        return YES;
    } else {
        return NO;
    }
}

@end
