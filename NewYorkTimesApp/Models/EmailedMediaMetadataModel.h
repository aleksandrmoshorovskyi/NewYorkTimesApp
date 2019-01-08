//
//  EmailedMediaMetadataModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/8/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EmailedMediaMetadataModel;

@interface EmailedMediaMetadataModel : JSONModel

@property (nonatomic, strong) NSString <Optional> *url;
@property (nonatomic, strong) NSString <Optional> *format;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;

@end

NS_ASSUME_NONNULL_END
