//
//  DataManager.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize container = _container;

+ (instancetype)sharedInstance {
    static DataManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DataManager new];
    });
    
    return manager;
}

- (void)save {
    NSError *error = nil;
    if ([self.container.viewContext hasChanges] && ![self.container.viewContext save:&error]) {
        NSLog(@"Context Save With Error %@", error);
    }
}

- (NSPersistentContainer *)container {
    
    @synchronized (self) {
        if (_container == nil) {
            _container = [NSPersistentContainer persistentContainerWithName:@"DataModel"];
            [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * storeDescription, NSError * error) {
                
                if (error) {
                    NSLog(@"Load Persistent Stores With Error %@", error);
                    abort();
                }
                
                
            }];
        }
    }
    
    return _container;
}

#pragma mark - Fetch data

- (NSArray *)fetchAllNotes {
    NSFetchRequest *request = [NewsEntry fetchRequest];
    
    NSArray *result = [self.container.viewContext executeFetchRequest:request error:nil];
    
    return result;
}

- (NSArray *)fetchNoteWithURL:(NSString *)url {
    NSFetchRequest *request = [NewsEntry fetchRequest];
    request.predicate = [NSPredicate predicateWithFormat:@"url like %@", url];
    
    NSArray *result = [self.container.viewContext executeFetchRequest:request error:nil];
    
    return result;
}

@end
