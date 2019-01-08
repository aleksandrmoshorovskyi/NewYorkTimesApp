//
//  NewsEntry+CoreDataProperties.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/8/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//
//

#import "NewsEntry+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NewsEntry (CoreDataProperties)

+ (NSFetchRequest<NewsEntry *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *abstract;
@property (nullable, nonatomic, copy) NSString *byline;
@property (nullable, nonatomic, copy) NSString *column;
@property (nullable, nonatomic, copy) NSString *countType;
@property (nullable, nonatomic, copy) NSString *publishedDate;
@property (nullable, nonatomic, copy) NSString *section;
@property (nullable, nonatomic, copy) NSString *source;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
