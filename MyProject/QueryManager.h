//
//  QueryManager.h
//  MyProject
//
//  Created by Zakaria on 17/07/2019.
//  Copyright © 2019 Hinteen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QueryManager : NSObject

+ (void)getJSonResponse:(void(^)(APIModel *))compBlock;
@end

NS_ASSUME_NONNULL_END
