//
//  UserInfoCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "UserInfoCell.h"

@interface UserInfoCell()

@property (nonatomic, strong) UIView *avatarView;

@end

@implementation UserInfoCell

- (UIView *)avatarView {
    if (!_avatarView) {
        _avatarView = [UIView new];
        _avatarView.backgroundColor = [CCColor colorWithRed:210/255.0 green:65/255.0 blue:64/255.0 alpha:1.0];
    }
    
    return _avatarView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [CCColor darkTextColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _nameLabel;
}

- (void) loadingSubviews {
    [self.contentView addSubview:self.avatarView];
    [self.contentView addSubview:self.nameLabel];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadingSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    
    CGFloat avatarViewWidth = 25.0;
    CGFloat avatarTopSpace = (CGRectGetHeight(bounds) - avatarViewWidth) / 2.0;
    CGFloat avatarLeftSpace = 8.0;
    self.avatarView.frame = CGRectMake(avatarLeftSpace, avatarTopSpace, avatarViewWidth, avatarViewWidth);
    self.avatarView.layer.cornerRadius = MIN(CGRectGetHeight(self.avatarView.frame), CGRectGetWidth(self.avatarView.frame)) / 2.0;
    self.avatarView.layer.masksToBounds = YES;
    
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.avatarView.frame) + 8.0, CGRectGetMinY(self.avatarView.frame), CGRectGetWidth(bounds) - CGRectGetMaxX(self.avatarView.frame) - 8.0 * 2, CGRectGetHeight(self.avatarView.frame));
    
}

@end
