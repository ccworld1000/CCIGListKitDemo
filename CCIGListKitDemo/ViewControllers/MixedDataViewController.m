//
//  MixedDataViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/15.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "MixedDataViewController.h"
#import "ExpandableSectionController.h"
#import "GridSectionController.h"
#import "UserSectionController.h"
#import "GridItem.h"
#import "User.h"

@interface MixedDataViewController () <IGListAdapterDataSource, IGListAdapterMoveDelegate>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISegmentedControl *control;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *moveList;

@property (nonatomic) BOOL isChnaged;

@property (nonatomic, strong) NSArray *segmentsTitles;
@property (nonatomic, strong) NSArray *segmentsClasses;

@property (nonatomic, strong) id selectedClass;

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;

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
        _collectionView.backgroundColor = [CCColor whiteColor];
    }
    
    return _collectionView;
}

- (UISegmentedControl *)control {
    if (!_control) {
        _control = [[UISegmentedControl alloc] initWithItems:self.segmentsTitles];
        _control.selectedSegmentIndex = 0;
        [_control addTarget:self action:@selector(onControl:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _control;
}

- (NSArray *)segmentsClasses {
    if (!_segmentsClasses) {
        _segmentsClasses = @[
                            [NSNull class],
                            [GridItem class],
                            [NSString class],
                            [User class],
                            ];
    }
    
    return _segmentsClasses;
}

- (NSArray *)segmentsTitles {
    if (!_segmentsTitles) {
        _segmentsTitles = @[
                            @"All",
                            @"Colors",
                            @"Text",
                            @"Users",
                            ];
    }
    
    return _segmentsTitles;
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
}

- (void) onControl : (UISegmentedControl *) control {
    NSInteger index = control.selectedSegmentIndex;
    
    CCDebugPrint(self.segmentsTitles[index]);
    
    self.selectedClass = self.segmentsClasses[index];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (void)viewDidLayoutSubviews {
    self.collectionView.frame = self.view.bounds;
}

- (void) handleLongGesture : (UILongPressGestureRecognizer *)gesture {
    UIGestureRecognizerState state = gesture.state;
    if (state == UIGestureRecognizerStateBegan) {
        CGPoint touchLocation = [gesture locationInView:self.collectionView];
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathForItemAtPoint:touchLocation];
        if (selectedIndexPath) {
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectedIndexPath];
            
            if (self.control.selectedSegmentIndex == 3) {
                self.isChnaged = YES;
            }
        }
    } else if (state == UIGestureRecognizerStateChanged) {
        UIView *view = gesture.view;
        if (view) {
            CGPoint position = [gesture locationInView:view];
            [self.collectionView updateInteractiveMovementTargetPosition:position];
        }
    } else if (state == UIGestureRecognizerStateEnded) {
        [self.collectionView endInteractiveMovement];
    } else {
        [self.collectionView cancelInteractiveMovement];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    self.navigationItem.titleView = self.control;
    
    self.longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongGesture:)];
    [self.collectionView addGestureRecognizer:self.longPressGesture];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
    self.adapter.moveDelegate = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    if (self.isChnaged && self.control.selectedSegmentIndex == 3) {
        return self.moveList;
    }
    
    if (!self.selectedClass || [[self.selectedClass class] isEqual:[NSNull class]]) {
        return self.data;
    }
    
    __block NSMutableArray *list = [NSMutableArray array];
    [self.data each:^(id object) {
        if ([object isKindOfClass:[self.selectedClass class]]) {
            [list addObject:object];
        }
    }];
    
    return list;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        return [ExpandableSectionController new];
    }
    
    if ([object isKindOfClass:[GridItem class]]) {
        return [[GridSectionController alloc] init:YES];
    }
    
    return [[UserSectionController alloc] init:YES];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)listAdapter:(IGListAdapter *)listAdapter
         moveObject:(id)object
               from:(NSArray *)previousObjects
                 to:(NSArray *)objects {
    self.moveList = objects;
}

@end
