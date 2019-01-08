//
//  NewsEntry+CoreDataProperties.m
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/8/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//
//

#import "NewsEntry+CoreDataProperties.h"

@implementation NewsEntry (CoreDataProperties)

+ (NSFetchRequest<NewsEntry *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"NewsEntry"];
}

@dynamic abstract;
@dynamic byline;
@dynamic column;
@dynamic countType;
@dynamic publishedDate;
@dynamic section;
@dynamic source;
@dynamic title;
@dynamic url;
@dynamic image;

@end
