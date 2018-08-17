//
//  StoryboardViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/1.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "StoryboardViewController.h"
#import "StoryboardLabelSectionController.h"
#import "Person.h"

@interface StoryboardViewController () <IGListAdapterDataSource, StoryboardLabelSectionControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) NSMutableArray *people;

@end

@implementation StoryboardViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (void) loadingData {
    self.people = @[
                    [[Person alloc] init: 1 name: @"Littlefinger"],
                    [[Person alloc] init: 2 name: @"Tommen Baratheon"],
                    [[Person alloc] init: 3 name: @"Roose Bolton"],
                    [[Person alloc] init: 4 name: @"Brienne of Tarth"],
                    [[Person alloc] init: 5 name: @"Bronn"],
                    [[Person alloc] init: 6 name: @"Gilly"],
                    [[Person alloc] init: 7 name: @"Theon Greyjoy"],
                    [[Person alloc] init: 8 name: @"Jaqen H'ghar"],
                    [[Person alloc] init: 9 name: @"Cersei Lannister"],
                    [[Person alloc] init: 10 name: @"Jaime Lannister"],
                    [[Person alloc] init: 11 name: @"Tyrion Lannister"],
                    [[Person alloc] init: 12 name: @"Melisandre"],
                    [[Person alloc] init: 13 name: @"Missandei"],
                    [[Person alloc] init: 14 name: @"Jorah Mormont"],
                    [[Person alloc] init: 15 name: @"Khal Moro"],
                    [[Person alloc] init: 16 name: @"Daario Naharis"],
                    [[Person alloc] init: 17 name: @"Jon Snow"],
                    [[Person alloc] init: 18 name: @"Arya Stark"],
                    [[Person alloc] init: 19 name: @"Bran Stark"],
                    [[Person alloc] init: 20 name: @"Sansa Stark"],
                    [[Person alloc] init: 21 name: @"Daenerys Targaryen"],
                    [[Person alloc] init: 22 name: @"Samwell Tarly"],
                    [[Person alloc] init: 23 name: @"Tormund"],
                    [[Person alloc] init: 24 name: @"Margaery Tyrell"],
                    [[Person alloc] init: 25 name: @"Varys"],
                    [[Person alloc] init: 26 name: @"Renly Baratheon"],
                    [[Person alloc] init: 27 name: @"Joffrey Baratheon"],
                    [[Person alloc] init: 28 name: @"Stannis Baratheon"],
                    [[Person alloc] init: 29 name: @"Hodor"],
                    [[Person alloc] init: 30 name: @"Tywin Lannister"],
                    [[Person alloc] init: 31 name: @"The Hound"],
                    [[Person alloc] init: 32 name: @"Ramsay Bolton"]
                    ].mutableCopy;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    StoryboardLabelSectionController *s = [StoryboardLabelSectionController new];
    s.delegate = self;
    
    return s;
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.people;
}

- (void) removeSectionControllerWantsRemoved : (StoryboardLabelSectionController *) sectionController {
    NSInteger section = [self.adapter sectionForSectionController:sectionController];
    [self.people removeObjectAtIndex:section];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

@end
