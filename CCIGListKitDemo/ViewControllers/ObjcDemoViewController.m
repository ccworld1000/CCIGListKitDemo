//
//  ObjcDemoViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "ObjcDemoViewController.h"
#import "Post.h"
#import "PostSectionController.h"

@interface ObjcDemoViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ObjcDemoViewController

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

- (NSArray *)data {
    if (!_data) {
        _data =  @[
                   [[Post alloc] initWithUsername:@"userA" comments:@[
                                                                      @"Luminous triangle",
                                                                      @"Awesome",
                                                                      @"Super clean",
                                                                      @"Stunning shot",
                                                                      ]],
                   [[Post alloc] initWithUsername:@"userB" comments:@[
                                                                      @"The simplicity here is superb",
                                                                      @"thanks!",
                                                                      @"That's always so kind of you!",
                                                                      @"I think you might like this",
                                                                      ]],
                   [[Post alloc] initWithUsername:@"userC" comments:@[
                                                                      @"So good",
                                                                      ]],
                   [[Post alloc] initWithUsername:@"userD" comments:@[
                                                                      @"hope she might like it.",
                                                                      @"I love it."
                                                                      ]],
                   ];
    }
    
    return _data;
}

- (void)viewDidLayoutSubviews {
    self.collectionView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview: self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [PostSectionController new];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.data;
}

@end
