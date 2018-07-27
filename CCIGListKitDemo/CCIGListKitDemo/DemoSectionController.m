//
//  DemoSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DemoSectionController.h"
#import "LabelCell.h"
#import "DemoItem.h"
#import <CCDebug/CCDebug.h>

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
    NSLog(@"CC didSelectItemAtIndex : %ld", index);
//    UIViewController *vc = [UIViewController new];
    
    NSString *classString = self.item.controllerClass;
    CCDebugPrint(classString);
    
    UIViewController *vc = [NSClassFromString(classString) new];
   
    vc.title = self.item.name;
//    [self.viewController.navigationController pushViewController:vc animated: YES];
      [self.viewController.navigationController pushViewController:vc animated: NO];
}

@end
