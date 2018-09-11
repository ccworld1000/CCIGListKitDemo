//
//  Month.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/11.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Month : NSObject <IGListDiffable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger days;
@property (nonatomic, strong) NSArray *appointments;

- (instancetype)initWithName : (NSString *)name days: (NSInteger) days appointments: (NSArray *) appointments ;

- (instancetype) init NS_UNAVAILABLE;
+ (instancetype) new NS_UNAVAILABLE;

@end
