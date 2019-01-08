//
//  MostEmailedModel.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedModel.h"
#import "AFNetworking.h"

@implementation EmailedModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"count_type":@"count_type",
                                                                  @"title":@"title",
                                                                  @"abstract":@"abstract"}];
}

+ (NSURLSessionDataTask *)loadDataWithComplitionBlock:(URLComplitionBlock)complitionBlock {
    
    NSString *path = [NSString stringWithFormat:@"%@%@", kBaseURL, kPathME_URL];
    
    return [[AFHTTPSessionManager manager] GET:path parameters:@{@"api-key":kApiKey} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error = nil;
        NSLog(@"test message 1");
        NSArray *result = [EmailedModel arrayOfModelsFromDictionaries:responseObject[@"results"] error:&error];
        NSLog(@"test message 2");
        
        if (error) {
            if (complitionBlock) {
                complitionBlock(nil, error.localizedDescription);
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
