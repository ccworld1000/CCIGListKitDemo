//
//  ViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/26.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "DemoItem.h"
#import "DemoSectionController.h"

@interface ViewController () <IGListAdapterDataSource> {
    NSArray *demos;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation ViewController

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (void) loadingDemos {
    demos = @[
              [[DemoItem alloc] initWithName:@"Tail Loading" controllerClass: @"LoadMoreViewController"],
              [[DemoItem alloc] initWithName:@"Search Autocomplete" controllerClass: @"SearchViewController"],
              [[DemoItem alloc] initWithName:@"Mixed Data" controllerClass: @"MixedDataViewController"],
              [[DemoItem alloc] initWithName:@"Nested Adapter" controllerClass: @"NestedAdapterViewController"],
              [[DemoItem alloc] initWithName:@"Empty View" controllerClass: @"EmptyViewController"],
              [[DemoItem alloc] initWithName:@"Single Section Controller" controllerClass: @"SingleSectionViewController"],
              //              [[DemoItem alloc] initWithName:@"Storyboard" controllerClass: @"SingleSectionViewController.self,controllerIdentifier: "demo"),
              //               [[DemoItem alloc] initWithName:@"Single Section Storyboard" controllerClass: @"SingleSectionStoryboardViewController.self,controllerIdentifier: "singleSectionDemo"),
              [[DemoItem alloc] initWithName:@"Working Range" controllerClass: @"WorkingRangeViewController"],
              [[DemoItem alloc] initWithName:@"Diff Algorithm" controllerClass: @"DiffTableViewController"],
              [[DemoItem alloc] initWithName:@"Supplementary Views" controllerClass: @"SupplementaryViewController"],
              [[DemoItem alloc] initWithName:@"Self-sizing cells" controllerClass: @"SelfSizingCellsViewController"],
              [[DemoItem alloc] initWithName:@"Display delegate" controllerClass: @"DisplayViewController"],
              [[DemoItem alloc] initWithName:@"Stacked Section Controllers" controllerClass: @"StackedViewController"],
              [[DemoItem alloc] initWithName:@"Objc Demo" controllerClass: @"ObjcDemoViewController"],
              [[DemoItem alloc] initWithName:@"Objc Generated Model Demo" controllerClass: @"ObjcGeneratedModelDemoViewController"],
              [[DemoItem alloc] initWithName:@"Calendar (auto diffing)" controllerClass: @"CalendarViewController"],
              [[DemoItem alloc] initWithName:@"Dependency Injection" controllerClass: @"AnnouncingDepsViewController"],
              [[DemoItem alloc] initWithName:@"Reorder Cells" controllerClass: @"ReorderableViewController"],
              [[DemoItem alloc] initWithName:@"Reorder Stacked Section Controllers" controllerClass: @"ReorderableStackedViewController"]
              ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Demos";
    [self loadingDemos];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return demos;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [DemoSectionController new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


@end
