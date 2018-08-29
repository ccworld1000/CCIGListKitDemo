//
//  GridItem.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import <Foundation/Foundation.h>

@interface GridItem : NSObject <IGListDiffable>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) CCColor *color;
@property (nonatomic) NSInteger itemCount;

- (instancetype)initWithColor : (CCColor *) color itemCount: (NSInteger) count;

@end
