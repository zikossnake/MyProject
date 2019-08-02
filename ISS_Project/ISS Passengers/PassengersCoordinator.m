//
//  PassengersCoordinator.m
//  ISS_Project
//
//  Created by Hinteen on 2019/8/1.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PassengersCoordinator.h"

@interface PassengersCoordinator () <PassengerListControllerDelegate>
{
    PassengerListController *passengerList;
    PassengersFormatter *passengerFormatter;
    QueryManager *queryManager;
}

@end

@implementation PassengersCoordinator

- (instancetype)initWithController:(PassengerListController *)controller
{
    self = [super init];
    if (self) {
        passengerList = controller;
        passengerList.delegate = self;
        
        passengerFormatter = [[PassengersFormatter alloc] init];
        queryManager = [[QueryManager alloc] init];
    }
    return self;
}

- (UIViewController *)startList
{
    return passengerList;
}

- (void)refreshPsssengers
{
    [queryManager getQueryWithURL:^(NSDictionary * response) {
        [self->passengerList updatePassengers:[self->passengerFormatter passengersJSON:response]];
    } andURL:@"http://api.open-notify.org/astros.json"];
}

#pragma MapControllerDelegate
- (void)refreshQuery
{
    [self refreshPsssengers];
}


@end
