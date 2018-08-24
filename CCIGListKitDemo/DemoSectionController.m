//
//  DemoSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DemoSectionController.h"
#import "LabelCell.h"


@interface DemoSectionController()

@property (nonatomic, strong) DemoItem *item;

@end

@implementation DemoSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.text = self.item.name;
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.item = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    NSString *classString = self.item.controllerClass;
    NSString *controllerIdentifier = self.item.controllerIdentifier;
    CCDebugPrint(classString);
    
    UIViewController *vc = nil;
    if (controllerIdentifier) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Demo" bundle: nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:controllerIdentifier];
    } else {
        vc = [NSClassFromString(classString) new];
    }
    
    if (vc) {
        vc.title = self.item.name;
        [self.viewController.navigationController pushViewController:vc animated: NO];
    } else {
        CCDebugWarningPrint([NSString stringWithFormat:@"%@ : [The interface may not be implemented] ", classString]);
    }
}

@end
