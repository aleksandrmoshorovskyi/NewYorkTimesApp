//
//  MostEmailedCell.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "EmailedCell.h"

@implementation EmailedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MostEmailedModel *)model {
    _model = model;
    
    self.title.text = _model.title;
    //self.serviceLogo.image = nil;
    //[self.serviceLogo setImageWithURL:[NSURL URLWithString:_model.imagePath]];
}

@end
