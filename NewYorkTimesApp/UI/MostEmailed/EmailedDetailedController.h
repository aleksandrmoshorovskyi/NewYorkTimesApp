//
//  EmailedDetailedController.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailedModel.h"
#import "NewsEntry+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmailedDetailedController : UIViewController

@property (nonatomic, strong) EmailedModel *model;

@property (nonatomic, strong) NewsEntry *newsEntry;

@end

NS_ASSUME_NONNULL_END
