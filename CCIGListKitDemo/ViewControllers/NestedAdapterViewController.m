//
//  NestedAdapterViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/2.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "NestedAdapterViewController.h"
#import "LabelSectionController.h"
#import "HorizontalSectionController.h"

@interface NestedAdapterViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation NestedAdapterViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
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
    _data = @[
              [[DemoItem alloc] initWithName:@"Ridiculus Elit Tellus Purus Aenean"],
              [[DemoItem alloc] initWithName:@"Condimentum Sollicitudin Adipiscing"],
              @14,
              [[DemoItem alloc] initWithName:@"Ligula Ipsum Tristique Parturient Euismod"],
              [[DemoItem alloc] initWithName:@"Purus Dapibus Vulputate"],
              @6,
              [[DemoItem alloc] initWithName:@"Tellus Nibh Ipsum Inceptos"],
              @2
              ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];

    [self.view addSubview: self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}


- (void)viewDidLayoutSubviews {
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        return [HorizontalSectionController new];
    } else {
        return [LabelSectionController new];
    }
    
}


- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
