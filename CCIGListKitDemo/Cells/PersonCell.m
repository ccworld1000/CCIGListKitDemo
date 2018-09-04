//
//  PersonCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "PersonCell.h"

@interface PersonCell ()

@property (nonatomic, strong) UIView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, assign) CGFloat separatorHeight;

@end

@implementation PersonCell

- (UIView *)avatarView {
    if (!_avatarView) {
        _avatarView = [UIView new];
        _avatarView.backgroundColor = [CCColor colorWithWhite:0.85 alpha:1.0];
    }
    
    return _avatarView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = [CCColor darkTextColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _nameLabel;
}

- (CGFloat)separatorHeight {
    _separatorHeight = (1 / [UIScreen mainScreen].scale);
    return _separatorHeight;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = [CCColor colorWithWhite:0.5 alpha:1.0];
    }
    
    return _separatorView;
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
    [self.contentView addSubview:self.avatarView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.separatorView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat outerInset = 10;
    const CGRect bounds = self.contentView.bounds;
    const CGRect insetBounds = CGRectInset(bounds, outerInset, outerInset);
    const CGFloat avatarViewWidth = insetBounds.size.height;
    
    const CGRect avatarViewFrame = CGRectMake(outerInset, outerInset, avatarViewWidth, avatarViewWidth);
    if (!CGRectEqualToRect(avatarViewFrame, self.avatarView.frame)) {
        self.avatarView.layer.cornerRadius = round(avatarViewWidth / 2.0);
        self.avatarView.layer.masksToBounds = YES;
        self.avatarView.frame = avatarViewFrame;
    }
    
    const CGFloat avatarLabelInset = 8;
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(avatarViewFrame) + avatarLabelInset,
                                      outerInset,
                                      CGRectGetWidth(insetBounds) - avatarViewWidth - avatarLabelInset * 2,
                                      CGRectGetHeight(insetBounds));
    
    self.separatorView.frame = CGRectMake(0,
                                          CGRectGetHeight(bounds) - self.separatorHeight,
                                          CGRectGetWidth(bounds),
                                          self.separatorHeight);
}

static NSAttributedString *AttributedStringForPerson(PersonModel *person) {
    NSMutableAttributedString *string = [NSMutableAttributedString new];
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:person.firstName
                                                                   attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]}]];
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:@" "
                                                                   attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]}]];
    [string appendAttributedString:[[NSAttributedString alloc] initWithString:person.lastName
                                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]}]];
    return string;
}

- (void)setPerson:(PersonModel *)person {
    _person = person;
    
    self.nameLabel.attributedText = AttributedStringForPerson(self.person);
}

@end
