//
//  WorkingRangeSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/17.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "WorkingRangeSectionController.h"
#import "ImageCell.h"
#import "LabelCell.h"

@interface WorkingRangeSectionController() <IGListWorkingRangeDelegate, IGListWorkingRangeDelegate>

@property (nonatomic) NSInteger height;
@property (nonatomic, strong) UIImage *downloadedImage;
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, copy) NSString *urlString;

@end

@implementation WorkingRangeSectionController

- (NSString *) urlString {
    CGFloat width = self.collectionContext.containerSize.width;
    
    if (width) {
        _urlString = [NSString stringWithFormat:@"https://unsplash.it/%lf/%ld", width, self.height];
        CCDebugPrint(_urlString);
        return _urlString;
    }
    
    return nil;
}

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.workingRangeDelegate = self;
    }
    
    return self;
}

- (void)dealloc {
    [self.task cancel];
}

- (NSInteger)numberOfItems {
    return 2;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = (index == 0) ? 55 : self.height;
    
    return CGSizeMake(width, height);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass = (index == 0) ? [LabelCell class] : [ImageCell class];
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    
    if ([cell isKindOfClass:[LabelCell class]]) {
        LabelCell *labelCell = (LabelCell *)cell;
        labelCell.text = self.urlString;
    } else if ([cell isKindOfClass:[ImageCell class]]) {
        ImageCell *imageCell = (ImageCell *)cell;
        [imageCell setImage:self.downloadedImage];
    }
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.height = [object integerValue];
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController *)sectionController {
    
    if (self.downloadedImage == nil && self.task && self.urlString) {
        NSURL *url = [NSURL URLWithString:self.urlString];
        NSString *msg = [NSString stringWithFormat:@"Downloading image %@ for section %ld", self.urlString, self.section];
        CCDebugPrint(msg);
        
        self.task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            UIImage *image = nil;
            if (data) {
                image = [UIImage imageWithData:data];
                
                __weak typeof(self) weakself = self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakself.downloadedImage = image;
                    ImageCell *cell = [self.collectionContext cellForItemAtIndex:1 sectionController:weakself];
                    if (cell) {
                        [cell setImage:image];
                    }
                });
            } else {
                NSLog(@"Error: %@", error);
            }
        }];
        
        [self.task resume];
    }
}

- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController *)sectionController {
    
}

@end
