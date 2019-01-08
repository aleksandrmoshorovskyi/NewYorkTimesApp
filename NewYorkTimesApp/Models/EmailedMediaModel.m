//
//  EmailedMediaModel.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedMediaModel.h"

@implementation EmailedMediaModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"type":@"type",
                                                                  @"subtype":@"subtype",
                                                                  @"caption":@"caption",
                                                                  @"copyright":@"copyright",
                                                                  @"approvedForSyndication":@"approvedForSyndication",
                                                                  @"mediaMetadata":@"media-metadata"
                                                                  }];
}

@end
