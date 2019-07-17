//
//  ViewController.m
//  MyProject
//
//  Created by Hinteen on 2019/7/17.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "PassengerListController.h"

@interface ViewController ()<UITabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MapViewController *mapController = [[MapViewController alloc] init];
    mapController.title = @"Live feed position";
    UINavigationController *mapNavigator = [[UINavigationController alloc]
                                             initWithRootViewController:mapController];
    
    PassengerListController *passController = [[PassengerListController alloc] init];
    passController.title = @"Passengers list";
    UINavigationController *passNavigator = [[UINavigationController alloc]
                                            initWithRootViewController:passController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSArray* controllers = [NSArray arrayWithObjects:mapNavigator, passNavigator, nil];
    tabBarController.viewControllers = controllers;
    [self.view addSubview:tabBarController.view];
    
}


@end
