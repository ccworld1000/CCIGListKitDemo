//
//  EmbeddedCollectionViewCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/3 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "EmbeddedCollectionViewCell.h"

@implementation EmbeddedCollectionViewCell

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [CCColor clearColor];
        _collectionView.alwaysBounceVertical = NO;
        _collectionView.alwaysBounceHorizontal = YES;
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionView.frame = self.contentView.frame;
}

@end
