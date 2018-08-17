//
//  LabelCell.h
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelCell : UICollectionViewCell

@property (nonatomic, strong) NSString * text;

+ (CGFloat) singleLineHeight;
+ (CGFloat) textHeight : (NSString *) text width: (CGFloat) width;

@end
