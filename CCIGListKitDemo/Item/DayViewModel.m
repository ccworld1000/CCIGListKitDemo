//
//  DayViewModel.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/13.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DayViewModel.h"

@implementation DayViewModel

- (instancetype)initWithDay: (NSInteger) day today : (BOOL) today selected : (BOOL) selected appointments : (NSInteger) appointments {
    self = [super init];
    if (self) {
        self.day = day;
        self.today = today;
        self.selected = selected;
        self.appointments = appointments;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return @(self.day);
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    
    DayViewModel *item = (DayViewModel *)object;
    
    return _today == item.today && _selected == item.selected && _appointments == item.appointments;
}

@end
