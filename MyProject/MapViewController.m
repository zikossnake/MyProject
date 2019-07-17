//
//  MapViewController.m
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "QueryManager.h"
#import "PositionModel.h"

@interface MapViewController ()<MKMapViewDelegate>
{
    MKMapView * mapView;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self selector:@selector(fetchPosition) userInfo:nil repeats:YES];
    
    
}

- (void)fetchPosition
{
    [QueryManager getPostion:^(PositionModel* model) {
        
        CLLocationCoordinate2D issPostion;
        issPostion.latitude = [model.latitude doubleValue];
        issPostion.longitude = [model.longitude doubleValue];
        
        MKPointAnnotation * issAnnotation = [[MKPointAnnotation alloc] init];
        issAnnotation.title = @"ISS Position";
        issAnnotation.coordinate = issPostion;
        [self->mapView addAnnotation:issAnnotation];
        
        MKCoordinateRegion region = MKCoordinateRegionMake(issPostion, MKCoordinateSpanMake(50, 50));
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self->mapView setRegion:region animated:YES];
        });
    }];
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
