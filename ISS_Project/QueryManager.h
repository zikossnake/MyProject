//
//  QueryManager.h
//  ISS_Project
//
//  Created by Hinteen on 2019/7/30.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QueryManager : NSObject

- (void) getQueryWithURL:(void(^)(NSDictionary *))compBlock andURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
