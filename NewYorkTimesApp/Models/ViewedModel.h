//
//  ViewedModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Constants.h"
#import "AFNetworking.h"
#import "ViewedMediaModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewedModel : JSONModel

@property (nonatomic, strong) NSString <Optional> *url;
@property (nonatomic, strong) NSString <Optional> *countType;
@property (nonatomic, strong) NSString <Optional> *column;
@property (nonatomic, strong) NSString <Optional> *section;
@property (nonatomic, strong) NSString <Optional> *byline;
@property (nonatomic, strong) NSString <Optional> *title;
@property (nonatomic, strong) NSString <Optional> *abstract;
@property (nonatomic, strong) NSString <Optional> *publishedDate;
@property (nonatomic, strong) NSString <Optional> *source;
@property (nonatomic, strong) NSArray <ViewedMediaModel> *media;

+ (NSURLSessionDataTask *)loadDataWithComplitionBlock:(URLComplitionBlock)complitionBlock;

@end

NS_ASSUME_NONNULL_END
