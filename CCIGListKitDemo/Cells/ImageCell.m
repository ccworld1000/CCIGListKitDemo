//
//  ImageCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation ImageCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    
    return _imageView;
}

- (UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityView startAnimating];
    }
    
    return _activityView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.activityView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.contentView.bounds;
    self.activityView.center = CGPointMake( bounds.size.width / 2.0, bounds.size.height / 2.0);
    self.imageView.frame = bounds;
}

- (void) setImage : (UIImage *) image {
    self.imageView.image = image;
    if (image) {
        [self.activityView stopAnimating];
    } else {
        [self.activityView startAnimating];
    }
}

@end
