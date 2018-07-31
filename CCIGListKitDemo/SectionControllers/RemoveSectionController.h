//
//  RemoveSectionController.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/30.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "IGListSectionController.h"

@class RemoveSectionController;

@protocol RemoveSectionDelegate <NSObject>

- (void) wantsRemoved : (RemoveSectionController *) sectionController;

@end

@interface RemoveSectionController : IGListSectionController

@property (nonatomic, weak) id<RemoveSectionDelegate> deleagte;

@end
