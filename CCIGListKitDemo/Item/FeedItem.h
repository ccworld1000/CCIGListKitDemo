//
//  FeedItem.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/22 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import <Foundation/Foundation.h>
#import "User.h"

@interface FeedItem : NSObject <IGListDiffable>

@property (nonatomic) NSInteger pk;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray *comments;

- (instancetype)initWithPK: (NSInteger) pk user : (User *) user comments: (NSArray *) comments;

@end
