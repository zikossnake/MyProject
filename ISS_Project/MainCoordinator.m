//
//  AppCoordinator.m
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "MainCoordinator.h"
#import "MapController.h"
#import "PassengerListController.h"
#import "PostionCoordinator.h"
#import "PassengersCoordinator.h"


@implementation MainCoordinator

- (UIViewController *) startTabBar
{
    MapController *mapController = [[MapController alloc] init];
    PostionCoordinator *posCoordinator = [[PostionCoordinator alloc] initWithController:mapController];
    UINavigationController *posNavigator = [[UINavigationController alloc]
                                             initWithRootViewController:[posCoordinator startMapView]];
    
    PostionCoordinator *passengerList = [[PostionCoordinator alloc] init];
    PassengersCoordinator *passCoordinator = [[PassengersCoordinator alloc] initWithController:passengerList];
    UINavigationController *passNavigator = [[UINavigationController alloc]
                                             initWithRootViewController:[passCoordinator startList]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSArray* controllers = [NSArray arrayWithObjects:posNavigator,passNavigator, nil];
    tabBarController.viewControllers = controllers;
    
    return tabBarController;
}

@end
