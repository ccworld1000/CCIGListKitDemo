//
//  SingleSectionStoryboardViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/1.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "SingleSectionStoryboardViewController.h"
#import "StoryboardCell.h"

@interface SingleSectionStoryboardViewController () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation SingleSectionStoryboardViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (NSMutableArray *)data {
    if (!_data) {
        NSInteger count = 20;
        _data = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count; i++) {
//            [_data addObject:[NSString stringWithFormat:@"%d", i]];
            [_data addObject:@(i)];
        }
    }
    
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.data;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    IGListSingleSectionCellConfigureBlock configureBlock = ^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
        StoryboardCell *sCell = cell;
        if (sCell) {
            sCell.textLabel.text = [NSString stringWithFormat:@"Cell: %ld", [item integerValue] + 1];
        }
    };
    IGListSingleSectionCellSizeBlock sizeBlock = ^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        if (collectionContext) {
            return CGSizeMake(collectionContext.containerSize.width, 44);
        } else {
            return CGSizeZero;
        }
    };
    
    IGListSingleSectionController *sectionController = [[IGListSingleSectionController alloc] initWithStoryboardCellIdentifier:@"cell" configureBlock:configureBlock sizeBlock:sizeBlock];
    sectionController.selectionDelegate = self;
    
    return sectionController;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController
                        withObject:(id)object {
    NSInteger section = [self.adapter sectionForSectionController:sectionController] + 1;
    
    UIAlertController *a = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Section %ld was selected 🎉", section]
                                                               message:nil
                                                        preferredStyle:UIAlertControllerStyleAlert];
    [a addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler: nil]];
    [self presentViewController:a animated:YES completion:nil];
}

@end
