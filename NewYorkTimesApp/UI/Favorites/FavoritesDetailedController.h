//
//  FavoritesDetailedController.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsEntry+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface FavoritesDetailedController : UIViewController

@property (nonatomic, strong) NewsEntry *model;

@end

NS_ASSUME_NONNULL_END
