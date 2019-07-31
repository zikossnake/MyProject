//
//  PositionFormatter.m
//  ISS_Project
//
//  Created by Zakaria on 31/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PositionFormatter.h"

@implementation PositionFormatter

- (CLLocationCoordinate2D)formatJsonResponse:(NSDictionary *)response
{
    NSDictionary *dictResult = response[@"iss_position"];
    _issPosition.latitude = [[dictResult objectForKey:@"latitude"] doubleValue];
    _issPosition.longitude = [[dictResult objectForKey:@"longitude"] doubleValue];
    
    return _issPosition;
}

@end
