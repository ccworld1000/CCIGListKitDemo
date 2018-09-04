//
//  PostSectionController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/9/4 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "PostSectionController.h"
#import "Post.h"
#import "UserInfoCell.h"
#import "PhotoCell.h"
#import "InteractiveCell.h"
#import "CommentCell.h"

static NSInteger cellsBeforeComments = 3;

@interface PostSectionController()

@property (nonatomic, strong) Post *post;

@end

@implementation PostSectionController

- (NSInteger)numberOfItems {
    return cellsBeforeComments + self.post.comments.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = 25.0;
    
    switch (index) {
        case 0:
        case 2:
            {
                height = 41.0;
            }
            break;
        case 1:
        {
            height = width;
        }
            break;
        default:
            break;
    }
    
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    Class cellClass;
    switch (index) {
        case 0:
            cellClass = [UserInfoCell class];
            break;
        case 1:
            cellClass = [PhotoCell class];
            break;
        case 2:
            cellClass = [InteractiveCell class];
            break;
        default:
            cellClass = [CommentCell class];
            break;
    }
    
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    
    if ([cell isKindOfClass:[CommentCell class]]) {
        ;
    } else if ([cell isKindOfClass:[UserInfoCell class]]) {
        UserInfoCell *uCell = (UserInfoCell *)cell;
        uCell.nameLabel.text = self.post.username;
    }
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.post = object;
}

@end
