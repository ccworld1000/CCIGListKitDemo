//
//  SingleSectionViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/31.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SingleSectionViewController.h"
#import "NibCell.h"

@interface SingleSectionViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation SingleSectionViewController

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        for (int i = 0 ; i < 20; i++) {
            [_data addObject:@(i)];
        }
    }
    
    return _data;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: [UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [CCColor whiteColor];
    }
    
    return _collectionView;
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
    
    [self.view addSubview: self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    IGListSingleSectionCellConfigureBlock configureBlock = ^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
        NibCell *nCell = cell;
        if (item) {
            nCell.label.text = [NSString stringWithFormat:@"Cell: %ld", [item integerValue] + 1];
        }
    };
    
    IGListSingleSectionCellSizeBlock sizeBlock = ^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        if (collectionContext) {
            return CGSizeMake(collectionContext.containerSize.width, 44);
        } else {
            return CGSizeZero;
        }
    };
    
    return [[IGListSingleSectionController alloc] initWithNibName:@"NibCell" bundle: nil configureBlock:configureBlock sizeBlock:sizeBlock];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
