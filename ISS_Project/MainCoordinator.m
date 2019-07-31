//
//  AppCoordinator.m
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "MainCoordinator.h"
#import "PostionCoordinator.h"

@implementation MainCoordinator

- (UITabBarController *) startTabBar
{
    PostionCoordinator *posCoordinator = [[PostionCoordinator alloc] init];
    UINavigationController *passNavigator = [[UINavigationController alloc]
                                             initWithRootViewController:[posCoordinator startMapView]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSArray* controllers = [NSArray arrayWithObjects:passNavigator, nil];
    tabBarController.viewControllers = controllers;
    
    return tabBarController;
}

@end
