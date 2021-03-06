//
//  EmptyViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/30 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "EmptyViewController.h"
#import "RemoveSectionController.h"

@interface EmptyViewController () <IGListAdapterDataSource, RemoveSectionDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic) NSInteger tally;

@end

@implementation EmptyViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [[CCColor whiteColor] colorWithAlphaComponent:0.9];
    }
    
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (void) onAdd {
    CCDebugPrint(@"onAdd");

    [self.data addObject:@(self.tally)];
    self.tally += 1;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (void) loadingData {
    self.tally = 4;
    if (!_data) {
        _data = [NSMutableArray array];
    }
    for (int i = 0; i < self.tally; i++) {
        [_data addObject:@(i)];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return _data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    RemoveSectionController *section = [RemoveSectionController new];
    section.deleagte = self;
    return section;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"No more data!";
    
    return label;
}

- (void)wantsRemoved:(RemoveSectionController *)sectionController {
    NSInteger section = [self.adapter sectionForSectionController:sectionController];
    NSUInteger index = [self.data indexOfObject:[self.adapter objectAtSection:section]];

    if (index != NSNotFound) {
        [self.data removeObjectAtIndex:index];
        [self.adapter performUpdatesAnimated:YES completion:nil];
    }
}


@end
