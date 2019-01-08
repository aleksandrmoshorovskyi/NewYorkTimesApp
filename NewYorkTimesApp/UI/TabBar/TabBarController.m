//
//  ViewController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/5/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FavoritesListController *vc1 = [[FavoritesListController alloc] initWithNibName:@"FavoritesListController" bundle:nil];
    EmailedListController *vc2 = [[EmailedListController alloc] initWithNibName:@"EmailedListController" bundle:nil];
    SharedListController *vc3 = [[SharedListController alloc] initWithNibName:@"SharedListController" bundle:nil];
    ViewedListController *vc4 = [[ViewedListController alloc] initWithNibName:@"ViewedListController" bundle:nil];
    
    vc1.title = @"Favorites";
    vc2.title = @"Most Emailed";
    vc3.title = @"Most Shared";
    vc4.title = @"Most Viewed";
    
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Most Emailed" image:[UIImage imageNamed:@"infonewsicon"] selectedImage:[UIImage imageNamed:@"infonewsicon"]];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Most Shared" image:[UIImage imageNamed:@"infonewsicon"] selectedImage:[UIImage imageNamed:@"infonewsicon"]];
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Most Viewed" image:[UIImage imageNamed:@"infonewsicon"] selectedImage:[UIImage imageNamed:@"infonewsicon"]];
    
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nvc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *nvc3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *nvc4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    self.viewControllers = @[nvc1, nvc2, nvc3, nvc4];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
