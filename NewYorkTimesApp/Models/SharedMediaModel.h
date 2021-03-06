//
//  SharedMediaModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/8/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "SharedMediaMetadataModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SharedMediaModel;

@interface SharedMediaModel : JSONModel

@property (nonatomic, strong) NSString <Optional> *type;
@property (nonatomic, strong) NSString <Optional> *subtype;
@property (nonatomic, strong) NSString <Optional> *caption;
@property (nonatomic, strong) NSString <Optional> *copyright;
@property (nonatomic, strong) NSString <Optional> *approvedForSyndication;
@property (nonatomic, strong) NSArray <SharedMediaMetadataModel> *mediaMetadata;

@end

NS_ASSUME_NONNULL_END
