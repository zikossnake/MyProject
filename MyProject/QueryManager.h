//
//  QueryManager.h
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionModel.h"
#import "PassengerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QueryManager : NSObject

+ (void)getPostion:(void(^)(PositionModel *))compBlock;
+ (void)getPassengers:(void(^)(NSMutableArray<PassengerModel *> *))compBlock;

@end

NS_ASSUME_NONNULL_END
