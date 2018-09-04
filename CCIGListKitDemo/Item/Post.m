//
//  Post.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "Post.h"

@implementation Post

- (instancetype)initWithUsername:(NSString *)username
                        comments:(NSArray *)comments {
    if (self = [super init]) {
        _username = username;
        _comments = comments;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    return self == object;
}

@end
