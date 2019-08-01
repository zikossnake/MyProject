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

@protocol MapControllerDelegate <NSObject>

- (void)refreshQuery;
- (void)stopRefreshQuery;

@end

@interface MapController : UIViewController

@property (nonatomic,assign) id<MapControllerDelegate> delegate;

- (void)updateISSPostion:(CLLocationCoordinate2D)issPosition;

@end

NS_ASSUME_NONNULL_END
