//
//  MostEmailedCell.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmailedCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *title;

@property (nonatomic, strong) MostEmailedModel *model;

@end

NS_ASSUME_NONNULL_END
