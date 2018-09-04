//
//  CommentCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "CommentCell.h"

@implementation CommentCell

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [UILabel new];
        _commentLabel.textColor = [CCColor colorWithRed:0.59 green:0.59 blue:0.57 alpha:1.0];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.font = [UIFont systemFontOfSize:11];
    }
    
    return _commentLabel;
}

- (void) loadingSubviews {
    [self.contentView addSubview:self.commentLabel];
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
    
    CGFloat left = 8.0;
    CGRect bounds = self.contentView.bounds;
    self.commentLabel.frame = CGRectMake(left, 0, bounds.size.width - left * 2, bounds.size.height);
}

@end
