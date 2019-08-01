//
//  MapController.m
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "MapController.h"

@interface MapController ()<MKMapViewDelegate>
{
    MKMapView * mapView;
}
@end

@implementation MapController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Live feed position";
    
    mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
    mapView.mapType = MKMapTypeStandard;
    mapView.showsCompass = NO;
    mapView.rotateEnabled = NO;
    mapView.showsUserLocation = NO;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
    mapView.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [mapView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [mapView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [mapView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [mapView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    [self.view layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_delegate startSendQuery];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_delegate stopSendQuery];
}

- (void)updateISSPostion:(CLLocationCoordinate2D)issPosition
{
    MKPointAnnotation * issAnnotation = [[MKPointAnnotation alloc] init];
    issAnnotation.title = @"ISS Position";
    issAnnotation.coordinate = issPosition;
    [self->mapView addAnnotation:issAnnotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(issPosition, MKCoordinateSpanMake(50, 50));
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self->mapView setRegion:region animated:YES];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
