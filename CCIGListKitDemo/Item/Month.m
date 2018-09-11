//
//  Month.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/11.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "Month.h"

@implementation Month

- (instancetype)initWithName : (NSString *)name days: (NSInteger) days appointments: (NSArray *) appointments {
    self = [super init];
    if (self) {
        self.name = name;
        self.days = days;
        self.appointments = appointments;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return self.name;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return YES;
}

@end
