//
//  SearchViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/27.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SearchViewController.h"
#import <IGListKit.h>
#import "DemoItem.h"
#import "LabelSectionController.h"

@interface SearchViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SearchViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[
             [[DemoItem alloc] initWithName:@"Tail Loading" controllerClass: @"LoadMoreViewController"],
             [[DemoItem alloc] initWithName:@"Search Autocomplete" controllerClass: @"SearchViewController"],
             [[DemoItem alloc] initWithName:@"Mixed Data" controllerClass: @"MixedDataViewController"],
             ];
}


- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [LabelSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}




@end
