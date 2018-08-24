//
//  SelfSizingSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SelfSizingSectionController.h"
#import "SelectionModel.h"
#import "ManuallySelfSizingCell.h"
#import "FullWidthSelfSizingCell.h"
#import "NibSelfSizingCell.h"

@interface SelfSizingSectionController()

@property (nonatomic, strong) SelectionModel *model;

@end

@implementation SelfSizingSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 40, 0);
        self.minimumLineSpacing = 4;
        self.minimumInteritemSpacing = 4;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.model.options.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = nil;
    
    NSString *text = self.model.options[index];
    switch (self.model.type) {
        case SelectionModelTypeNone:
        {
            ManuallySelfSizingCell *manualCell = [self.collectionContext dequeueReusableCellOfClass:[ManuallySelfSizingCell class] forSectionController:self atIndex:index];
            manualCell.label.text = text;
            cell = manualCell;
        }
            break;
        case SelectionModelTypeFullWidth:
        {
            FullWidthSelfSizingCell *manualCell = [self.collectionContext dequeueReusableCellOfClass:[FullWidthSelfSizingCell class] forSectionController:self atIndex:index];
            manualCell.label.text = text;
            cell = manualCell;
        }
            break;
        case SelectionModelTypeNib:
        {
            NibSelfSizingCell *manualCell = [self.collectionContext dequeueReusableCellWithNibName:@"NibSelfSizingCell" bundle:nil forSectionController:self atIndex:index];
            manualCell.contentLabel.text = text;
            cell = manualCell;
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.model = object;
}

@end
