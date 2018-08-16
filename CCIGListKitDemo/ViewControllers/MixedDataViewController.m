//
//  MixedDataViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "MixedDataViewController.h"
#import "GridItem.h"
#import "User.h"

@interface MixedDataViewController ()

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISegmentedControl *control;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSDictionary *segments;

@end

@implementation MixedDataViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    }
    
    return _collectionView;
}

- (UISegmentedControl *)control {
    if (!_control) {
        _control = [[UISegmentedControl alloc] initWithItems:_segments.allKeys];
        _control.selectedSegmentIndex = 0;
    }
    
    return _control;
}

- (void) loadingData {
    self.data = @[
                  @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                  [[GridItem alloc] initWithColor:[CCColor colorWithRed:237 / 255.0 green:73 / 255.0 blue:86 / 255.0 alpha:1] itemCount:6],
                  [[User alloc] initWithPK:2 name:@"Ryan Olson" handle:@"ryanolsonk"],
                  @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                  [[User alloc] initWithPK:4 name:@"Oliver Rickard" handle:@"ocrickard"],
                  [[GridItem alloc] initWithColor:[CCColor colorWithRed:56 / 255.0 green:151 / 255.0 blue:240 / 255.0 alpha:1] itemCount:5],
                  @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                  [[User alloc] initWithPK:3 name:@"Jesse Squires" handle:@"jesse_squires"],
                  [[GridItem alloc] initWithColor:[CCColor colorWithRed:112 / 255.0 green:192 / 255.0 blue:80 / 255.0 alpha:1] itemCount:3],
                  @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
                  [[GridItem alloc] initWithColor:[CCColor colorWithRed:163 / 255.0 green:42 / 255.0 blue:186 / 255.0 alpha:1] itemCount:7],
                  [[User alloc] initWithPK:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"]
                  ];
    
    self.segments = @{
                  @"All" : [NSNull class],
                  @"Colors" : [GridItem class],
                  @"Text" : [NSString class],
                  @"Users" : [User class],
                  };

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    self.navigationItem.titleView = self.control;
}


@end
