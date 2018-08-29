//
//  DemoItem.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import <Foundation/Foundation.h>

@interface DemoItem : NSObject <IGListDiffable>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *controllerClass;
@property (nonatomic, copy, readonly) NSString *controllerIdentifier;

- (instancetype) initWithName : (NSString *)name;
- (instancetype) initWithName : (NSString *)name controllerClass: (NSString *) controllerClass;
- (instancetype) initWithName : (NSString *)name controllerClass: (NSString *) controllerClass controllerIdentifier : (NSString *) controllerIdentifier;

- (instancetype) init NS_UNAVAILABLE;
+ (instancetype) new NS_UNAVAILABLE;

@end
