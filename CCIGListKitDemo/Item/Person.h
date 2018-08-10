//
//  Person.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/10.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <IGListDiffable>

- (instancetype)init : (NSInteger) value name : (NSString *) name;

@property (nonatomic, strong) NSNumber *pk;
@property (nonatomic, strong) NSString *name;

@end
