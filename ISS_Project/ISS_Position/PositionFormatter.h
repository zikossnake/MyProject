//
//  PositionFormatter.h
//  ISS_Project
//
//  Created by Zakaria on 31/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PositionFormatter : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D issPosition;

- (CLLocationCoordinate2D)formatJsonResponse:(NSDictionary *)response;

@end

NS_ASSUME_NONNULL_END
