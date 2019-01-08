//
//  EmailedMediaModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "EmailedMediaMetadataModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EmailedMediaModel;

@interface EmailedMediaModel : JSONModel

@property (nonatomic, strong) NSString <Optional> *type;
@property (nonatomic, strong) NSString <Optional> *subtype;
@property (nonatomic, strong) NSString <Optional> *caption;
@property (nonatomic, strong) NSString <Optional> *copyright;
@property (nonatomic, strong) NSString <Optional> *approvedForSyndication;
@property (nonatomic, strong) NSArray <EmailedMediaMetadataModel> *mediaMetadata;

@end

NS_ASSUME_NONNULL_END
