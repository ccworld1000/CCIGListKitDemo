//
//  RemoveCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/30 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "RemoveCell.h"

@implementation RemoveCell

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [CCColor clearColor];
        [self.contentView addSubview:_label];
    }
    
    return _label;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"Remove" forState:UIControlStateNormal];
        [_button setTitleColor:[CCColor blueColor] forState:UIControlStateNormal];
        _button.backgroundColor = [CCColor clearColor];
        [self.contentView addSubview:_button];
    }
    
    return _button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [CCColor whiteColor];
    CGRect bounds = self.contentView.bounds;
    CGFloat width = bounds.size.width;
    CGFloat height = bounds.size.height;
    CGFloat spaece = 15;
    CGFloat labelWidth = 100;
    
    self.button.frame = CGRectMake(spaece, 0, width - 2 * spaece - labelWidth, height);
    self.label.frame = CGRectMake( width - spaece - labelWidth, 0, labelWidth, height);
}

@end
