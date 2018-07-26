//
//  DemoItem.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DemoItem.h"

@interface DemoItem ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *controllerClass;
@property (nonatomic, copy) NSString *controllerIdentifier;

@end

@implementation DemoItem

- (instancetype) initWithName : (NSString *)name controllerClass: (NSString *) controllerClass {
    return [self initWithName:name controllerClass:controllerClass controllerIdentifier:nil];
}

- (instancetype) initWithName : (NSString *)name controllerClass: (NSString *) controllerClass controllerIdentifier : (NSString *) controllerIdentifier {
    self = [super init];
    if (self) {
        self.name = name;
        self.controllerClass = controllerClass;
        self.controllerIdentifier = controllerIdentifier;
    }
    
    return self;
}

- (nonnull id<NSObject>)diffIdentifier {
    return _name;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }
    
    DemoItem *item = (DemoItem *)object;
    
    return _controllerClass == item.controllerClass && _controllerIdentifier == item.controllerIdentifier;
}

@end
