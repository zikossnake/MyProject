//
//  QueryManager.m
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "QueryManager.h"

@implementation QueryManager

+ (void)getPostion:(void(^)(PositionModel *))compBlock
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.open-notify.org/iss-now.json"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@",responseDictionary);
            if (compBlock) {
                compBlock([self positionJSON:responseDictionary]);
            }
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
}

+ (PositionModel *)positionJSON:(NSDictionary *)response
{
    NSDictionary *dictResult = response[@"iss_position"];
    PositionModel *model = [PositionModel new];
    model.latitude = [dictResult objectForKey:@"latitude"];
    model.longitude = [dictResult objectForKey:@"longitude"];
    
    return model;
}

#pragma Get_Passengers
+ (void)getPassengers:(void(^)(NSMutableArray<PassengerModel *> *))compBlock
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.open-notify.org/astros.json"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@",responseDictionary);
            if (compBlock) {
                compBlock([self passengersJSON:responseDictionary]);
            }
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
}

+ (NSMutableArray<PassengerModel *> *)passengersJSON:(NSDictionary *)response
{
    NSMutableArray *arrayResult = [NSMutableArray new];
    NSArray *arrayPeople = response[@"people"];
    for (NSDictionary *dictResult in arrayPeople) {
        PassengerModel *model = [PassengerModel new];
        model.craft = [dictResult objectForKey:@"craft"];
        model.name = [dictResult objectForKey:@"name"];
        
        [arrayResult addObject:model];
    }
    
    return arrayResult;
}


@end
