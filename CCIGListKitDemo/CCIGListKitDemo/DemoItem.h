//
//  DemoItem.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <IGListKit.h>

@interface DemoItem : NSObject <IGListDiffable>

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *controllerClass;
@property (nonatomic, copy, readonly) NSString *controllerIdentifier;

- (instancetype) initWithName : (NSString *)name controllerClass: (NSString *) controllerClass;

@end
