//
//  PassengersFormatter.m
//  ISS_Project
//
//  Created by Hinteen on 2019/8/1.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "PassengersFormatter.h"

@implementation PassengersFormatter

- (NSMutableArray *)passengersJSON:(NSDictionary *)response
{
    NSMutableArray *arrayResult = [NSMutableArray new];
    NSArray *arrayPeople = response[@"people"];
    for (NSDictionary *dictResult in arrayPeople) {
        [arrayResult addObject:dictResult];
    }
    
    return arrayResult;
}

@end
