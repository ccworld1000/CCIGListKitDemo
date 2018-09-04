//
//  Post.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import <Foundation/Foundation.h>

@interface Post : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSArray *comments;

- (instancetype)initWithUsername:(NSString *)username
                        comments:(NSArray *)comments NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
