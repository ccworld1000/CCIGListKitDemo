//
//  GridItem.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "GridItem.h"

@interface GridItem()

@property (nonatomic, strong) CCColor *color;
@property (nonatomic) NSInteger itemCount;

@end

@implementation GridItem

- (instancetype)initWithColor : (CCColor *) color itemCount: (NSInteger) count {
    self = [super init];
    if (self) {
        self.color = color;
        self.itemCount = count;
    }
    
    return self;
}




@end
