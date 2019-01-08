//
//  FavoritesCell.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "FavoritesCell.h"

@implementation FavoritesCell

- (void)setModel:(NewsEntry *)model {
    _model = model;
    
    self.title.text = _model.title;
}

@end
