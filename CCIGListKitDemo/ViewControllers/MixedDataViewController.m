//
//  MixedDataViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "MixedDataViewController.h"

@interface MixedDataViewController ()

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MixedDataViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
