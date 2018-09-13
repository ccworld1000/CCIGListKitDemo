//
//  DayViewModel.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/13.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayViewModel : NSObject <IGListDiffable>

@property (nonatomic) NSInteger day;
@property (nonatomic) BOOL today;
@property (nonatomic) BOOL selected;
@property (nonatomic) NSInteger appointments;

- (instancetype)initWithDay: (NSInteger) day today : (BOOL) today selected : (BOOL) selected appointments : (NSInteger) appointments;

-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end
