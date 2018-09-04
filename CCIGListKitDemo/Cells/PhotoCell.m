//
//  PhotoCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "PhotoCell.h"

@implementation PhotoCell

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentView.backgroundColor = [CCColor colorWithRed:4/255.0 green:170/255.0 blue:166/255.0 alpha:1.0];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
            self.contentView.backgroundColor = [CCColor colorWithRed:4/255.0 green:170/255.0 blue:166/255.0 alpha:1.0];
    }
    return self;
}

@end
