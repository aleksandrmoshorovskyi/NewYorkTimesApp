//
//  EmailedModel.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedModel.h"
#import "AFNetworking.h"

@implementation EmailedModel

+ (NSURLSessionDataTask *)loadDataWithComplitionBlock:(URLComplitionBlock)complitionBlock {
    
    NSString *path = [NSString stringWithFormat:@"%@%@", kBaseURL, kPathME_URL];
    
    return [[AFHTTPSessionManager manager] GET:path parameters:@{@"api-key":kApiKey} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error = nil;
        NSArray *result = [EmailedModel arrayOfModelsFromDictionaries:responseObject[@"results"] error:&error];
        
        if (error) {
            if (complitionBlock) {
                complitionBlock(nil, error.localizedDescription);
                NSLog(@"%@", error.localizedDescription);
            }
        } else {
            if (complitionBlock) {
                complitionBlock(result, nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
