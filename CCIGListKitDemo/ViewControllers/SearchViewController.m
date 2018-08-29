//
//  SearchViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/7/27 - now.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCIGListKitDemo

#import "SearchViewController.h"
#import "LabelSectionController.h"
#import "SearchSectionController.h"

@interface SearchViewController () <IGListAdapterDataSource, SearchSectionControllerDelegate>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *words;
@property (nonatomic, strong) NSNumber *searchToken;
@property (nonatomic, copy) NSString *filterString;

@end

@implementation SearchViewController

- (NSMutableArray *)words {
    if (!_words) {
        _words = [NSMutableArray array];
        
        NSString * str = @"Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth.";
        
        __block NSMutableArray *unique = [NSMutableArray array];
        NSRange range = NSMakeRange(0, str.length - 1);
        
        __weak typeof(self) wSelf = self;
        [str enumerateSubstringsInRange:range options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            NSString *string  = substring;
            if (string) {
                if (![unique containsObject:string]) {
                    [unique addObject:string];
                    [wSelf.words addObject:[[DemoItem alloc] initWithName:string]];
                }
            }
        }];
    }
    
    return _words;
}

- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self];
    }
    
    return _adapter;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    
    return _collectionView;
}

- (void) loadingData {
    self.searchToken = @(42);
    self.filterString = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadingData];
    
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *list = [NSMutableArray arrayWithObjects:self.searchToken, nil];
    if ([self.filterString isEqualToString:@""]) {
        [list concat:self.words];
    } else {
        NSString *find = [self.filterString lowercaseString];
        __block NSMutableArray *fList = [NSMutableArray arrayWithCapacity:0];
        [self.words enumerateObjectsUsingBlock:^(DemoItem * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([[obj.name lowercaseString] containsString:find]) {
                [fList addObject:obj];
            }
        }];
        
        [list concat:fList];
    }
    
    return list;
}


- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSNumber class]]) {
        SearchSectionController *searchSectionController = [SearchSectionController new];
        searchSectionController.delegate = self;
        return searchSectionController;
    } else {
        return [LabelSectionController new];
    }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void) searchSectionController : (SearchSectionController *) sectionController didChangeText: (NSString *) text {
    self.filterString = text;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

@end
