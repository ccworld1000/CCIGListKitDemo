//
//  SearchSectionController.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/8 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "IGListSectionController.h"

@class SearchSectionController;

@protocol SearchSectionControllerDelegate<NSObject>

- (void) searchSectionController : (SearchSectionController *) sectionController didChangeText: (NSString *) text;

@end

@interface SearchSectionController : IGListSectionController

@property (nonatomic, weak) id<SearchSectionControllerDelegate> delegate;

@end
