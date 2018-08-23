//
//  ManuallySelfSizingCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "ManuallySelfSizingCell.h"

@implementation ManuallySelfSizingCell

- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.backgroundColor = [[CCColor greenColor] colorWithAlphaComponent:0.1];
        _label.numberOfLines = 1;
        _label.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self.contentView addSubview: self.label];
        
        NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:15];
        NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:15];
        NSLayoutConstraint *c3 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:15];
        NSLayoutConstraint *c4 = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:15];
        
        [self.contentView addConstraint:c1];
        [self.contentView addConstraint:c2];
        [self.contentView addConstraint:c3];
        [self.contentView addConstraint:c4];
    }
    
    return self;
}

@end
