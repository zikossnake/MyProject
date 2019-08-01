//
//  PassengersFormatter.h
//  ISS_Project
//
//  Created by Hinteen on 2019/8/1.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassengersFormatter : NSObject

- (NSMutableArray *)passengersJSON:(NSDictionary *)response;

@end

NS_ASSUME_NONNULL_END
