//
//  SharedCell.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SharedCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *title;

@property (nonatomic, strong) SharedModel *model;

@end

NS_ASSUME_NONNULL_END
