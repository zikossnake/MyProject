//
//  PostionCoordinator.h
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MapController.h"
#import "QueryManager.h"
#import "PositionFormatter.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostionCoordinator : NSObject

- (instancetype)initWithController:(MapController *)controller;

- (UIViewController *) startMapView;

@end

NS_ASSUME_NONNULL_END
