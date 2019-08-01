//
//  PassengerListController.h
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PassengerListControllerDelegate <NSObject>

- (void)refreshQuery;

@end

@interface PassengerListController : UIViewController

@property (nonatomic,assign) id<PassengerListControllerDelegate> delegate;

- (void)updatePassengers:(NSMutableArray *)passengersList;

@end

NS_ASSUME_NONNULL_END
