//
//  StoryboardLabelSectionController.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "IGListSectionController.h"

@class StoryboardLabelSectionController;

@protocol StoryboardLabelSectionControllerDelegate <NSObject>

- (void) removeSectionControllerWantsRemoved : (StoryboardLabelSectionController *) sectionController;

@end;

@interface StoryboardLabelSectionController : IGListSectionController

@property (nonatomic, weak) id <StoryboardLabelSectionControllerDelegate> delegate;

@end
