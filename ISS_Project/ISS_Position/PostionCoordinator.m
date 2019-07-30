//
//  PostionCoordinator.m
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PostionCoordinator.h"
#import "MapController.h"
#import "ProtocolManager.h"

@interface PostionCoordinator ()
{
    MapController *mapController;
}

@end

@implementation PostionCoordinator

- (UIViewController *) startMapView
{
    mapController = [[MapController alloc] init];
    return mapController;
}

@end
