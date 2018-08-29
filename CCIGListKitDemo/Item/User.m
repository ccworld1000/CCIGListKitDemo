//
//  User.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "User.h"

@interface User()

@property (nonatomic) NSInteger pk;

@end

@implementation User

- (instancetype)initWithPK: (NSInteger) pk name : (NSString *) name handle: (NSString *) handle {
    self = [super init];
    if (self) {
        self.pk = pk;
        self.name = name;
        self.handle = handle;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return @(self.pk);
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    BOOL res = NO;
    if (self == object) {
        res = YES;
        return res;
    }
    
    if ([(id)object isKindOfClass:[User class]]) {
        User *item = (User *)object;
        return [self.name isEqualToString: item.name] && [self.handle isEqualToString:item.handle];
    }
    
    return res;
}

@end
