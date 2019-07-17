//
//  PassengerListController.m
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PassengerListController.h"
#import "QueryManager.h"
#import "PassengerModel.h"

@interface PassengerListController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *arrayPassengers;
}

@end

@implementation PassengerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayPassengers = [NSMutableArray new];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableView];
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [tableView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [tableView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [tableView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    [self.view layoutIfNeeded];
    
    [QueryManager getPassengers:^(NSMutableArray<PassengerModel *> * modelArray) {
        NSLog(@"modelArray : %@",modelArray);
        self->arrayPassengers = modelArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView reloadData];
        });
    }];
}

#pragma TableViewDelegation
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayPassengers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
        
    PassengerModel *model = [arrayPassengers objectAtIndex:indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.craft;
    
    return cell;
}


@end
