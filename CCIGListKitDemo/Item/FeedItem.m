//
//  FeedItem.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/22.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "FeedItem.h"

@implementation FeedItem

- (instancetype)initWithPK: (NSInteger) pk user : (User *) user comments: (NSArray *) comments {
    self = [super init];
    
    if (self) {
        self.pk = pk;
        self.user = user;
        self.comments = comments;
    }
    
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return @(self.pk);
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    if (self ==  object) {
        return YES;
    }
    
    if ([(id)object isKindOfClass:[self class]]) {
        FeedItem *item = (FeedItem *)object;
        return [self.user isEqualToDiffableObject:item.user] && self.comments == item.comments;
    }
    
    return NO;
}

@end
