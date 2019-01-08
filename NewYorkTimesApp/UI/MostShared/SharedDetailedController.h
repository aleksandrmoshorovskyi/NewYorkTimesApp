//
//  SharedDetailedController.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedModel.h"
#import "NewsEntry+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SharedDetailedController : UIViewController

@property (nonatomic, strong) SharedModel *model;

@property (nonatomic, strong) NewsEntry *newsEntry;

@end

NS_ASSUME_NONNULL_END
