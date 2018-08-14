//
//  DiffTableViewController.m
//  CCIGListKitDemo
//
//  Created by dengyouhua on 2018/8/10.
//  Copyright © 2018 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "DiffTableViewController.h"
#import "Person.h"

@interface DiffTableViewController ()

@property (nonatomic, strong) NSArray *peopleForOld;
@property (nonatomic, strong) NSArray *peopleForNew;
@property (nonatomic, strong) NSArray *people;
@property (nonatomic) BOOL usingOldPeople;

@end

@implementation DiffTableViewController

- (void) loadingData {
    self.peopleForOld = @[
                          [[Person alloc] init: 1 name: @"Kevin"],
                          [[Person alloc] init: 2 name: @"Mike"],
                          [[Person alloc] init: 3 name: @"Ann"],
                          [[Person alloc] init: 4 name: @"Jane"],
                          [[Person alloc] init: 5 name: @"Philip"],
                          [[Person alloc] init: 6 name: @"Mona"],
                          [[Person alloc] init: 7 name: @"Tami"],
                          [[Person alloc] init: 8 name: @"Jesse"],
                          [[Person alloc] init: 9 name: @"Jaed"]
                          ];
    
    self.peopleForNew = @[
                          [[Person alloc] init: 2 name: @"Mike"],
                          [[Person alloc] init: 10 name: @"Marne"],
                          [[Person alloc] init: 5 name: @"Philip"],
                          [[Person alloc] init: 1 name: @"Kevin"],
                          [[Person alloc] init: 3 name: @"Ryan"],
                          [[Person alloc] init: 8 name: @"Jesse"],
                          [[Person alloc] init: 7 name: @"Tami"],
                          [[Person alloc] init: 4 name: @"Jane"],
                          [[Person alloc] init: 9 name: @"Chen"]
                          ];
    
    self.people = self.peopleForOld;
    self.usingOldPeople = YES;
    
}

- (void) onDiff {
    CCDebugWarningPrint(@"onDiff");

    NSInteger fromSection = 0;
    NSInteger toSection = 0;
    
    NSArray *from = self.people;
    NSArray *to = self.usingOldPeople ? self.peopleForNew : self.peopleForOld;
    
    _usingOldPeople = !_usingOldPeople;
    
    IGListIndexPathResult *result = [IGListDiffPaths(fromSection, toSection, from, to, IGListDiffEquality) resultForBatchUpdates];
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:result.deletes withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertRowsAtIndexPaths:result.inserts withRowAnimation:UITableViewRowAnimationFade];
    NSArray *moves = result.moves;
    for (IGListMoveIndexPath * item in moves) {
        [self.tableView moveRowAtIndexPath:item.from toIndexPath:item.to];
    }
    [self.tableView endUpdates];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadingData];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(onDiff)];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    if (row < self.people.count) {
        Person *p = self.people[row];
        cell.textLabel.text = p.name;
    }

    return cell;
}

@end
