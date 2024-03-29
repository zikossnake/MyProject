//
//  PostionCoordinator.m
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PostionCoordinator.h"

@interface PostionCoordinator () <MapControllerDelegate>
{
    MapController *mapController;
    QueryManager *queryManager;
    PositionFormatter *postionFormatter;
    
    NSTimer *refresh;
}

@end

@implementation PostionCoordinator

- (instancetype)initWithController:(MapController *)controller
{
    self = [super init];
    if (self) {
        mapController = controller;
        mapController.delegate = self;
        
        queryManager = [[QueryManager alloc] init];
        postionFormatter = [[PositionFormatter alloc] init];
    }
    return self;
}

- (UIViewController *) startMapView
{
    return mapController;
}

- (void)refreshPosition
{
    [queryManager getQueryWithURL:^(NSDictionary * response) {
        [self->mapController updateISSPostion:[self->postionFormatter formatJsonResponse:response]];
    } andURL:@"http://api.open-notify.org/iss-now.json"];
}

#pragma MapControllerDelegate
- (void)refreshQuery
{
    refresh = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self selector:@selector(refreshPosition) userInfo:nil repeats:YES];
}

- (void)stopRefreshQuery
{
    [refresh invalidate];
    refresh = nil;
}

@end
