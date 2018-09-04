//
//  ObjcGeneratedModelDemoViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "ObjcGeneratedModelDemoViewController.h"
#import "PersonSectionController.h"
#import "PersonModel.h"

@interface ObjcGeneratedModelDemoViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *persons;

@end

@implementation ObjcGeneratedModelDemoViewController

- (NSArray *)persons {
    if (!_persons) {
        _persons = @[[[PersonModel alloc] initWithFirstName:@"Ryan" lastName:@"Nystrom" uniqueId:@"1"],
                     [[PersonModel alloc] initWithFirstName:@"Jesse" lastName:@"Squires" uniqueId:@"2"],
                     [[PersonModel alloc] initWithFirstName:@"Markus" lastName:@"Emrich" uniqueId:@"3"],
                     [[PersonModel alloc] initWithFirstName:@"James" lastName:@"Sherlock" uniqueId:@"4"],
                     [[PersonModel alloc] initWithFirstName:@"Bofei" lastName:@"Zhu" uniqueId:@"5"],
                     [[PersonModel alloc] initWithFirstName:@"Valeriy" lastName:@"Van" uniqueId:@"6"],
                     [[PersonModel alloc] initWithFirstName:@"Hesham" lastName:@"Salman" uniqueId:@"7"],
                     [[PersonModel alloc] initWithFirstName:@"Bas" lastName:@"Broek" uniqueId:@"8"],
                     [[PersonModel alloc] initWithFirstName:@"Andrew" lastName:@"Monshizadeh" uniqueId:@"9"],
                     [[PersonModel alloc] initWithFirstName:@"Adlai" lastName:@"Holler" uniqueId:@"10"],
                     [[PersonModel alloc] initWithFirstName:@"Ben" lastName:@"Asher" uniqueId:@"11"],
                     [[PersonModel alloc] initWithFirstName:@"Jake" lastName:@"Lin" uniqueId:@"12"],
                     [[PersonModel alloc] initWithFirstName:@"Jeff" lastName:@"Bailey" uniqueId:@"13"],
                     [[PersonModel alloc] initWithFirstName:@"Daniel" lastName:@"Alamo" uniqueId:@"14"],
                     [[PersonModel alloc] initWithFirstName:@"Viktor" lastName:@"Gardart" uniqueId:@"15"],
                     [[PersonModel alloc] initWithFirstName:@"Anton" lastName:@"Sotkov" uniqueId:@"16"],
                     [[PersonModel alloc] initWithFirstName:@"Guilherme" lastName:@"Rambo" uniqueId:@"17"],
                     [[PersonModel alloc] initWithFirstName:@"Rizwan" lastName:@"Ibrahim" uniqueId:@"18"],
                     [[PersonModel alloc] initWithFirstName:@"Ayush" lastName:@"Saraswat" uniqueId:@"19"],
                     [[PersonModel alloc] initWithFirstName:@"Dustin" lastName:@"Shahidehpour" uniqueId:@"20"],
                     ];
    }
    
    return _persons;
}

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
    return [PersonSectionController new];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.persons;
}



@end
