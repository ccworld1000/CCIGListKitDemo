//
//  InteractiveCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "InteractiveCell.h"

@interface InteractiveCell()

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) CALayer *separator;



@end

@implementation InteractiveCell

- (UIButton *) createButtonWithTitle: (NSString *) title {
    CCColor *color = [CCColor colorWithRed:28/255.0 green:30/255.0 blue:28/255.0 alpha:1];
    CCFont *font = [CCFont systemFontOfSize:12.0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button sizeToFit];
    
    return button;
}

- (UIButton *)likeButton {
    if (!_likeButton) {
        _likeButton = [self createButtonWithTitle:@"Like"];
    }
    
    return _likeButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [self createButtonWithTitle:@"Comment"];
    }
    
    return _commentButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [self createButtonWithTitle:@"Share"];
    }
    
    return _shareButton;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.backgroundColor = [CCColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1.0].CGColor;
    }
    
    return _separator;
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

- (void) loadingSubviews {
    [self.contentView addSubview:self.likeButton];
    [self.contentView addSubview:self.commentButton];
    [self.contentView addSubview:self.shareButton];
    
    [self.contentView.layer addSublayer:self.separator];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    CGFloat leftPadding = 8.0;
    CGFloat height = bounds.size.height;
    CGFloat width = CGRectGetWidth(self.likeButton.frame);

    self.likeButton.frame = CGRectMake(leftPadding, 0, width, height);
    
    width = CGRectGetWidth(self.commentButton.frame);
    self.commentButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.likeButton.frame), 0, width, height);
    
    width = CGRectGetWidth(self.shareButton.frame);
    self.shareButton.frame = CGRectMake(leftPadding + CGRectGetMaxX(self.commentButton.frame), 0, width, height);
    
    height = 0.5;
    self.separator.frame = CGRectMake(leftPadding, bounds.size.height - height, bounds.size.width - leftPadding, height);
}

@end
