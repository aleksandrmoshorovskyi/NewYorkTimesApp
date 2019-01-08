//
//  DataManager.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/7/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "NewsEntry+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (nonatomic, readonly) NSPersistentContainer *container;

+ (instancetype)sharedInstance;

- (void)save;

- (NSArray *)fetchAllNotes;

- (NSArray *)fetchNoteWithURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
