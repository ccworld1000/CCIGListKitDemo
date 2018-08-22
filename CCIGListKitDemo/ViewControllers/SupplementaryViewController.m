//
//  SupplementaryViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/22.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SupplementaryViewController.h"
#import "FeedItem.h"
#import "FeedItemSectionController.h"

@interface SupplementaryViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSArray *feedItems;

@end

@implementation SupplementaryViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [CCColor whiteColor];
    }
    
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (NSArray *)feedItems {
    if (!_feedItems) {
        _feedItems = @[
                       [[FeedItem alloc] initWithPK: 1 user: [[User alloc] initWithPK:100 name:@"Jesse" handle:@"jesse_squires"] comments: @[@"You rock!", @"Hmm you sure about that?"]],
                       [[FeedItem alloc] initWithPK: 2 user: [[User alloc] initWithPK:101 name:@"Ryan" handle:@"_ryannystrom"] comments: @[@"lgtm", @"lol", @"Let's try it!"]],
                       [[FeedItem alloc] initWithPK: 3 user: [[User alloc] initWithPK:102 name:@"Ann" handle:@"abaum"] comments: @[@"Good luck!"]],
                       [[FeedItem alloc] initWithPK: 4 user: [[User alloc] initWithPK:103 name:@"Phil" handle:@"phil"] comments: @[@"yoooooooo", @"What's the eta?"]]
                       ];
    }
    
    return _feedItems;
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
    return self.feedItems;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [FeedItemSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
