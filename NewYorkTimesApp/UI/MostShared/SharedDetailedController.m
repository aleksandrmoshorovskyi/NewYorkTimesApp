//
//  SharedDetailedController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "SharedDetailedController.h"
#import "DataManager.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SharedDetailedController () {
    IBOutlet UIButton *saveButton;
    IBOutlet UIImageView *newsImage;
    NSArray *result;
}

@property (nonatomic, weak) IBOutlet UILabel *titleLable;
@property (nonatomic, weak) IBOutlet UILabel *textLable;

@end

@implementation SharedDetailedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLable.text = self.model.title;
    self.textLable.text = self.model.abstract;
    
    SharedMediaModel *media = self.model.media[0];
    SharedMediaMetadataModel *mediaURl = media.mediaMetadata[2];

//    [newsImage setImageWithURL:[NSURL URLWithString:mediaURl.url]];
    [newsImage sd_setImageWithURL:[NSURL URLWithString:mediaURl.url]];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)setButtonTitle {
    result = [[DataManager sharedInstance] fetchNoteWithURL:self.model.url];
    
    if (result.firstObject) {
        saveButton.selected = YES;
        [saveButton setTitle:@"It's favorite" forState:UIControlStateNormal];
    } else {
        saveButton.selected = NO;
        [saveButton setTitle:@"Add to favorites" forState:UIControlStateNormal];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setButtonTitle];
}

#pragma mark - Actions

- (IBAction)saveButtonClicked:(id)sender {
    
    if (!result.firstObject) {
        self.newsEntry = [[NewsEntry alloc] initWithContext:[DataManager sharedInstance].container.viewContext];
        self.newsEntry.url = self.model.url;
        self.newsEntry.title = self.model.title;
        self.newsEntry.abstract = self.model.abstract;
        
        NSData *dataImage = UIImageJPEGRepresentation(newsImage.image, 1.0);
        self.newsEntry.image = dataImage;
        
        [[DataManager sharedInstance] save];
        [self setButtonTitle];
    } else {
        [[DataManager sharedInstance].container.viewContext deleteObject:result.firstObject];
        [[DataManager sharedInstance] save];
        [self setButtonTitle];
    }
    
}

@end
