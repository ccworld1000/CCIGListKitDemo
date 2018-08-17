//
//  User.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

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

/**
 Returns whether the receiver and a given object are equal.
 
 @param object The object to be compared to the receiver.
 
 @return `YES` if the receiver and object are equal, otherwise `NO`.
 */
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
