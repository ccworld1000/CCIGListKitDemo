//
//  LoadMoreViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "LoadMoreViewController.h"
#import <IGListKit.h>

@interface LoadMoreViewController () <IGListAdapterDataSource, UIScrollViewDelegate> {
    BOOL loading;
    NSMutableArray *items;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation LoadMoreViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    }
    
    return _collectionView;
}

- (void) loadingItems {
    items = [NSMutableArray array];
    for (int i = 0; i < 20 ; i++) {
        [items addObject:@(i)];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.view;
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return items;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
