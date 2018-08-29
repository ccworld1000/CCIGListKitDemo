//
//  User.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import <Foundation/Foundation.h>

@interface User : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *handle;

- (instancetype)initWithPK: (NSInteger) pk name : (NSString *) name handle: (NSString *) handle;

@end
