//
//  SharedCell.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "SharedCell.h"

@implementation SharedCell

- (void)setModel:(SharedModel *)model {
    _model = model;
    
    self.title.text = _model.title;
}

@end
