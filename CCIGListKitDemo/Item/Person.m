//
//  Person.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/10.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init : (NSInteger) value name : (NSString *) name {
    self = [super init];
    if (self) {
        _pk = [NSNumber numberWithInteger:value];
        _name = name;
    }
    
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return _pk;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    Person *person = (Person *)object;
    if ([person isKindOfClass : [Person class]]) {
        return self.name == person.name;
    } else {
        return NO;
    }
}

@end
