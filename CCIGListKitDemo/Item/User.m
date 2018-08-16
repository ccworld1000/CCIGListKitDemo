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
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *handle;

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

@end
