//
//  NibSelfSizingCell.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/23 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "NibSelfSizingCell.h"

@implementation NibSelfSizingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentLabel.backgroundColor = [[CCColor grayColor] colorWithAlphaComponent:0.1];
}

@end
