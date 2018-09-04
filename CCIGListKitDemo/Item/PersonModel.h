//
//  PersonModel.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject <IGListDiffable>

@property (nonatomic, readonly, strong) NSString *firstName;
@property (nonatomic, readonly, strong) NSString *lastName;
@property (nonatomic, readonly, strong) NSString *uniqueId;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName uniqueId:(NSString *)uniqueId NS_DESIGNATED_INITIALIZER;

@end

