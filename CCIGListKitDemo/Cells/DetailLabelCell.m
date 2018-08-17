//
//  DetailLabelCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DetailLabelCell.h"

@implementation DetailLabelCell

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [CCColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = [CCColor darkTextColor];
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.backgroundColor = [CCColor clearColor];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.font = [UIFont systemFontOfSize:17];
        _detailLabel.textColor = [CCColor lightGrayColor];
        [self.contentView addSubview: _detailLabel];
    }
    
    return _detailLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat padding = 15.0;
    
    CGRect frame = CGRectInset(self.contentView.bounds, padding, 0);
    self.titleLabel.frame = frame;
    self.detailLabel.frame = frame;
}

@end
