//
//  MostEmailedModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Constants.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmailedModel : NSObject

@property (nonatomic, strong) NSString <Optional> *count_type;
@property (nonatomic, strong) NSString <Optional> *title;
@property (nonatomic, strong) NSString <Optional> *imagePath;

+ (NSURLSessionDataTask *)loadDataWithComplitionBlock:(URLComplitionBlock)complitionBlock;

@end

NS_ASSUME_NONNULL_END
