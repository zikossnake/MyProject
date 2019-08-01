//
//  PassengerListController.m
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PassengerListController.h"

@interface PassengerListController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *arrayPassengers;
    UITableView *PassengerstableView;
}

@end

@implementation PassengerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Passengers list";
    
    arrayPassengers = [NSMutableArray new];
    
    UITableView *PassengerstableView = [[UITableView alloc] initWithFrame:CGRectZero];
    PassengerstableView.delegate = self;
    PassengerstableView.dataSource = self;
    PassengerstableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:PassengerstableView];
    
    PassengerstableView.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [PassengerstableView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [PassengerstableView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [PassengerstableView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [PassengerstableView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    [self.view layoutIfNeeded];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_delegate refreshQuery];
}

- (void)updatePassengers:(NSMutableArray *)passengersList
{
    arrayPassengers = passengersList;
    [PassengerstableView reloadData];
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
    
    return cell;
}


@end
