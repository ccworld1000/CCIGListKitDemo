//
//  PersonModel.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName uniqueId:(NSString *)uniqueId {
    if ((self = [super init])) {
        _firstName = firstName;
        _lastName = lastName;
        _uniqueId = uniqueId;
    }
    
    return self;
}

- (id<NSObject>)diffIdentifier {
    return _uniqueId;
}

- (NSUInteger)hash {
    NSUInteger subhashes[] = {[_firstName hash], [_lastName hash], [_uniqueId hash]};
    NSUInteger result = subhashes[0];
    for (int ii = 1; ii < 3; ++ii) {
        unsigned long long base = (((unsigned long long)result) << 32 | subhashes[ii]);
        base = (~base) + (base << 18);
        base ^= (base >> 31);
        base *=  21;
        base ^= (base >> 11);
        base += (base << 6);
        base ^= (base >> 22);
        result = base;
    }
    return result;
}

- (BOOL)isEqual:(PersonModel *)object {
    if (self == object) {
        return YES;
    } else if (self == nil || object == nil || ![object isKindOfClass:[self class]]) {
        return NO;
    }
    return
    (_firstName == object->_firstName ? YES : [_firstName isEqual:object->_firstName]) &&
    (_lastName == object->_lastName ? YES : [_lastName isEqual:object->_lastName]) &&
    (_uniqueId == object->_uniqueId ? YES : [_uniqueId isEqual:object->_uniqueId]);
}

- (BOOL)isEqualToDiffableObject:(nullable id)object {
    return [self isEqual:object];
}


@end
