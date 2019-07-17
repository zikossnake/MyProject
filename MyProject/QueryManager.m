//
//  QueryManager.m
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import "QueryManager.h"

@implementation QueryManager

+ (void)getJSonResponse:(void(^)(APIModel *))compBlock
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
                compBlock([self processingJsonDic:responseDictionary]);
            }
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
}

+ (APIModel *)processingJsonDic:(NSDictionary *)response
{
    NSDictionary *dictResult = response[@"iss_position"];
    APIModel *model = [APIModel new];
    model.latitude = [dictResult objectForKey:@"latitude"];
    model.longitude = [dictResult objectForKey:@"longitude"];
    
    return model;
}


@end
