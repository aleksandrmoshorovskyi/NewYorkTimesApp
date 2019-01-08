//
//  ViewController.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/5/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "TabBarController.h"
//#import "ViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc1 = [FavoritesListController new];
    //UIViewController *vc2 = [FavoritesListController new];
    // создаем ViewController1 программно используя метод nib-файл
    MostEmailedListController *vc2 = [[MostEmailedListController alloc] initWithNibName:@"MostEmailedListController" bundle:nil];
    // отобразим данный контроллер
    //[self.navigationController pushViewController:viewController2 animated:YES];
    UIViewController *vc3 = [FavoritesListController new];
    UIViewController *vc4 = [FavoritesListController new];
    
    vc1.title = @"VC1";
    vc2.title = @"VC2";
    vc3.title = @"VC3";
    vc4.title = @"VC4";
    
    // cоздаем программно tabBarItem
    // 1. используем системный айтем
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    // 2. исмользуем custom item
    //vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Trainings" image:[UIImage imageNamed:@"tab2"] tag:0];
    //vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"tab3"] selectedImage:[UIImage imageNamed:@"tab3Activ"]];
    
    UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nvc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *nvc3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *nvc4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    self.viewControllers = @[nvc1, nvc2, nvc3, nvc4];
    
    // меняем цвета на таббаре
    //    self.tabBar.tintColor = [UIColor greenColor]; // - выделеного елемента
    //    self.tabBar.barTintColor = [UIColor yellowColor]; // - background
    //    self.tabBar.unselectedItemTintColor = [UIColor magentaColor];
    //
    //    UIImage *img = [TabBarController imageFromColor:[UIColor blackColor]];
    //    UIImage *resizeImg = [TabBarController resizeImage:img];
    //
    //    self.tabBar.selectionIndicatorImage = resizeImg;
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)resizeImage:(UIImage *)img {
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2,
                                                             img.size.width/2,
                                                             img.size.height/2 - 1,
                                                             img.size.width/2 - 1)];
}

@end
