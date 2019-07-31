//
//  MapController.h
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapController : UIViewController

- (void) updateISSPostion:(CLLocationCoordinate2D)issPosition;

@end

NS_ASSUME_NONNULL_END
