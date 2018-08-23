//
//  SelfSizingCellsViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SelfSizingCellsViewController.h"
#import "SelfSizingSectionController.h"
#import "SelectionModel.h"

@interface SelfSizingCellsViewController ()<IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adpater;

@property (nonatomic, strong) NSArray *data;

@end

@implementation SelfSizingCellsViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [CCColor colorWithRed:0.831372549 green:0.945098039 blue:0.964705882 alpha:1];
    }
    
    return _collectionView;
}

- (IGListAdapter *)adpater {
    if (!_adpater) {
        _adpater = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adpater;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    self.adpater.collectionView = self.collectionView;
    self.adpater.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}


- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [SelfSizingSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


@end
