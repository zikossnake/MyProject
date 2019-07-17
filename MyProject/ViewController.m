//
//  ViewController.m
//  MyProject
//
//  Created by Hinteen on 2019/7/17.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    MapViewController *mapController = [[MapViewController alloc] init];
    mapController.title = @"Live feed position";
    UINavigationController *mapNavigator = [[UINavigationController alloc]
                                             initWithRootViewController:mapController];
        NSArray* controllers = [NSArray arrayWithObjects:mapNavigator, mapNavigator, mapNavigator, nil];
    tabBarController.viewControllers = controllers;
    [self.view addSubview:tabBarController.view];
    
    
    
    
}


@end
