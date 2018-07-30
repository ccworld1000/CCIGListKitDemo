//
//  LabelCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "LabelCell.h"

@interface LabelCell()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) CALayer *separator;

@end

@implementation LabelCell

- (NSString *)text {
    return self.label.text;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:199 / 255.0 blue:204 / 255.0 alpha:1].CGColor;
    }
    
    return _separator;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:17];
    }
    
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.label];
        [self.layer addSublayer:self.separator];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 15, 8, 15);
    CGRect bounds = self.contentView.bounds;
    CGFloat height = 0.5;
    CGFloat left = insets.left;
    
    self.label.frame = UIEdgeInsetsInsetRect(bounds, insets);
    self.separator.frame = CGRectMake(left, bounds.size.height - height, bounds.size.width - left, height);
}

@end
