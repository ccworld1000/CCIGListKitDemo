//
//  WorkingRangeViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "WorkingRangeViewController.h"
#import "WorkingRangeSectionController.h"

@interface WorkingRangeViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *data;

@end

@implementation WorkingRangeViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:2];
    }
    
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [CCColor whiteColor];
    }
    
    return _collectionView;
}

- (void) loadingData {
    NSInteger count = 20;
    
    NSMutableSet *set = [NSMutableSet set];
    while (set.count < count) {
        [set addObject:@(arc4random_uniform(200) + 200)];
    }
    
    self.data = set.allObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [WorkingRangeSectionController new];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.data;
}

@end
