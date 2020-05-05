//
//  StackedViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/27 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "StackedViewController.h"
#import "WorkingRangeSectionController.h"
#import "DisplaySectionController.h"
#import "HorizontalSectionController.h"

@interface StackedViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSArray *data;

@end

@implementation StackedViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [[CCColor whiteColor] colorWithAlphaComponent:0.95];
    }
    
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:1];
    }
    
    return _adapter;
}

- (NSArray *)data {
    if (!_data) {
        _data = @[
                  @(128),
                  @(256),
                  @(64),
                  ];
    }
    
    return _data;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

//- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
//    IGListStackedSectionController *sectionController = [[IGListStackedSectionController alloc] initWithSectionControllers:@[
//                                                                                                                             [WorkingRangeSectionController new],
//                                                                                                                             [DisplaySectionController new],
//                                                                                                                             [HorizontalSectionController new],
//                                                                                                                             ]];
//    sectionController.inset = UIEdgeInsetsMake(0, 0, 20, 0);
//    return sectionController;
//}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


@end
