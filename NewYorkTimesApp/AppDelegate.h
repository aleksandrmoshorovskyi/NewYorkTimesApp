//
//  AppDelegate.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/5/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

