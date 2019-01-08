//
//  FavoritesDetailedController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "FavoritesDetailedController.h"
#import "DataManager.h"

@interface FavoritesDetailedController () {
    IBOutlet UIImageView *newsImage;
}

@property (nonatomic, weak) IBOutlet UILabel *titleLable;
@property (nonatomic, weak) IBOutlet UILabel *textLable;

@end

@implementation FavoritesDetailedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViewConstraints];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (self.model.url) {
        self.titleLable.text = self.model.title;
        self.textLable.text = self.model.abstract;
        
        newsImage.image = [UIImage imageWithData:self.model.image];
    } else {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    [self updateViewConstraints];
}

#pragma mark - Actions

- (IBAction)deleteButtonClicked:(id)sender {
    [[DataManager sharedInstance].container.viewContext deleteObject:self.model];
    [[DataManager sharedInstance] save];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
