//
//  SharedMediaModel.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/8/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "SharedMediaModel.h"

@implementation SharedMediaModel

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
