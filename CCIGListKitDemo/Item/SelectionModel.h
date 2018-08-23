//
//  SelectionModel.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SelectionModelType) {
    SelectionModelTypeNone,
    SelectionModelTypeFullWidth,
    SelectionModelTypeNib,
};

@interface SelectionModel : NSObject <IGListDiffable>

@property (nonatomic, strong) NSArray *options;
@property (nonatomic) SelectionModelType type;

- (instancetype)initWithOptions: (NSArray *)options type: (SelectionModelType) type;

@end
