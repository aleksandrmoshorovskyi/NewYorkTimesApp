//
//  ViewedDetailedController.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewedModel.h"
#import "NewsEntry+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewedDetailedController : UIViewController

@property (nonatomic, strong) ViewedModel *model;

@property (nonatomic, strong) NewsEntry *newsEntry;

@end

NS_ASSUME_NONNULL_END
