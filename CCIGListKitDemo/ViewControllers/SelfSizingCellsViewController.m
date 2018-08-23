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
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.estimatedItemSize = CGSizeMake(100, 40);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
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

- (NSArray *)data {
    if (!_data) {
        _data = @[
                  [[SelectionModel alloc] initWithOptions:@[@"Leverage agile", @"frameworks", @"robust synopsis", @"high level", @"overviews",
                                                             @"Iterative approaches", @"corporate strategy", @"foster collaborative",
                                                             @"overall value", @"proposition", @"Organically grow", @"holistic world view",
                                                             @"disruptive", @"innovation", @"workplace diversity", @"empowerment"] type:SelectionModelTypeNone],
                  
                  [[SelectionModel alloc] initWithOptions: @[@"Bring to the table", @"win-win", @"survival", @"strategies", @"proactive domination",
                                                           @"At the end of the day", @"going forward", @"a new normal", @"evolved", @"generation X",
                                                           @"runway heading", @"streamlined", @"cloud solution", @"User generated", @"content",
                                                           @"in real-time", @"multiple touchpoints", @"offshoring"] type:SelectionModelTypeNib],
                  
                  [[SelectionModel alloc] initWithOptions:@[@"Aenean lacinia bibendum nulla sed consectetur. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis consectetur purus sit amet fermentum.",
                                                           @"Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere consectetur est at lobortis. Cras justo odio, dapibus ac facilisis in, egestas eget quam.",
                                                           @"Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum."] type:SelectionModelTypeFullWidth],
                  
                  ];
    }
    
    return _data;
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
