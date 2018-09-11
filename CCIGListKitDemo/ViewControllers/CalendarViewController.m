//
//  CalendarViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "CalendarViewController.h"
#import "MonthSectionController.h"
#import "Month.h"

@interface CalendarViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSArray *months;

@end

@implementation CalendarViewController

- (NSArray *)months {
    if (!_months) {
        NSDate *date = [NSDate new];
        NSInteger currentMonth = [NSCalendar.currentCalendar component:NSCalendarUnitMonth fromDate:date];
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        NSArray *appointments = @[
                                  @{@2: @[@"Hair"]},
                                  @{@4: @[@"Nails"]},
                                  @{@7: @[@"Doctor appt", @"Pick up groceries"]},
                                  @{@12: @[@"Call back the cable company", @"Find a babysitter"]},
                                  @{@13: @[@"Dinner at The Smith"]},
                                  @{@17: @[@"Buy running shoes", @"Buy a fitbit", @"Start running"]},
                                  @{@20: @[@"Call mom"]},
                                  @{@21: @[@"Contribute to IGListKit"]},
                                  @{@25: @[@"Interview"]},
                                  @{@26: @[@"Quit running", @"Buy ice cream"]}
                                  ];

        Month *m = [[Month alloc] initWithName:dateFormatter.monthSymbols[currentMonth - 1] days:30 appointments:appointments];
        _months = @[m];
    }
    
    return _months;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview: self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        IGListCollectionViewLayout *layout = [[IGListCollectionViewLayout alloc] initWithStickyHeaders:NO topContentInset:0 stretchToEdge:NO];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
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

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [MonthSectionController new];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.months;
}


@end
