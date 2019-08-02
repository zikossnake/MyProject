//
//  PassengersCoordinator.h
//  ISS_Project
//
//  Created by Hinteen on 2019/8/1.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PassengerListController.h"
#import "PassengersFormatter.h"
#import "QueryManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PassengersCoordinator : NSObject

- (instancetype)initWithController:(PassengerListController *)controller;

- (UIViewController *)startList;

@end

NS_ASSUME_NONNULL_END
