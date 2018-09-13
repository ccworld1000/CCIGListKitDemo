//
//  MonthSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/13.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "MonthSectionController.h"
#import "Month.h"
#import "DayViewModel.h"
#import "MonthTitleViewModel.h"
#import "MonthTitleCell.h"
#import "CalendarDayCell.h"
#import "LabelCell.h"

@interface MonthSectionController() <IGListBindingSectionControllerDataSource, IGListBindingSectionControllerSelectionDelegate>

@property (nonatomic) NSInteger selectedDay;
@property (nonatomic, strong) Month *month;

@end

@implementation MonthSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataSource = self;
        self.selectionDelegate = self;
        self.selectedDay = -1;
    }
    return self;
}

- (NSArray<id<IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController
                               viewModelsForObject:(id)object {
    self.month = object;
    
    NSDate *date = [NSDate new];
    NSInteger today = [NSCalendar.currentCalendar component:NSCalendarUnitDay fromDate:date];
    
    NSMutableArray *viewModels = [NSMutableArray array];
    [viewModels addObject:[[MonthTitleViewModel alloc] initWithName:self.month.name]];
    
    NSArray *appointments = self.month.appointments;
    for (int day = 1; day < self.month.days + 1; day++) {
        NSArray *list = appointments[day];
        DayViewModel *viewModel = [[DayViewModel alloc] initWithDay:day today:day == today selected:day == self.selectedDay appointments:list.count];
        [viewModels addObject:viewModel];
    }
    
    NSArray *list = appointments[self.selectedDay];
    for (int appointment = 0; appointment < list.count; appointment++) {
        [viewModels addObject:list[appointment]];
    }
    
    return viewModels;
}


- (UICollectionViewCell<IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController
                                           cellForViewModel:(id)viewModel
                                                    atIndex:(NSInteger)index {
    Class name = nil;
    if ([viewModel isKindOfClass:[DayViewModel class]]) {
        name = [CalendarDayCell class];
    } else if ([viewModel isKindOfClass:[MonthTitleViewModel class]]) {
        name = [MonthTitleCell class] ;
    } else {
        name = [LabelCell class];
    }
    
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:name forSectionController:self atIndex:index];
    
    return cell;
}


- (CGSize)sectionController:(IGListBindingSectionController *)sectionController
           sizeForViewModel:(id)viewModel
                    atIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    if ([viewModel isKindOfClass:[DayViewModel class]]) {
        CGFloat square = width / 7.0;
        return CGSizeMake(square, square);
    } else if ([viewModel isKindOfClass:[MonthTitleViewModel class]]) {
        return CGSizeMake(width, 30.0);
    } else {
        return CGSizeMake(width, 55.0);
    }
}

- (void)sectionController:(IGListBindingSectionController *)sectionController
     didSelectItemAtIndex:(NSInteger)index
                viewModel:(id)viewModel {
    DayViewModel *item = viewModel;
    
    if (item.day == self.selectedDay) {
        self.selectedDay = -1;
    } else {
        self.selectedDay = self.selectedDay;
    }
    
    [self updateAnimated:YES completion:nil];
}



@end
