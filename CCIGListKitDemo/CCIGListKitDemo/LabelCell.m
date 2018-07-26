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

@end

@implementation LabelCell

- (NSString *)text {
    return self.label.text;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
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
    }
    
    return self;
}

- (void)layoutSubviews {
//    UIEdgeInsetsMake(8, 15, 8, 15);
    self.label.frame = UIEdgeInsetsInsetRect(self.contentView.bounds, UIEdgeInsetsMake(8, 15, 8, 15));
}

@end
