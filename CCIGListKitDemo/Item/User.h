//
//  User.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/16.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <IGListDiffable>

- (instancetype)initWithPK: (NSInteger) pk name : (NSString *) name handle: (NSString *) handle;

@end
