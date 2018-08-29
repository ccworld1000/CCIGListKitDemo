//
//  CenterLabelCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/8 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "CenterLabelCell.h"

@implementation CenterLabelCell

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [CCColor clearColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [CCColor whiteColor];
        _label.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_label];
    }
    
    return _label;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.contentView.bounds;
}

@end
