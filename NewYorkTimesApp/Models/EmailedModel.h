//
//  EmailedModel.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Constants.h"
#import "EmailedMediaModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmailedModel : JSONModel

@property (nonatomic, strong) NSString <Optional> *url;
@property (nonatomic, strong) NSString <Optional> *countType;
@property (nonatomic, strong) NSString <Optional> *column;
@property (nonatomic, strong) NSString <Optional> *section;
@property (nonatomic, strong) NSString <Optional> *byline;
@property (nonatomic, strong) NSString <Optional> *title;
@property (nonatomic, strong) NSString <Optional> *abstract;
@property (nonatomic, strong) NSString <Optional> *publishedDate;
@property (nonatomic, strong) NSString <Optional> *source;
@property (nonatomic, strong) NSArray <EmailedMediaModel> *media;

+ (NSURLSessionDataTask *)loadDataWithComplitionBlock:(URLComplitionBlock)complitionBlock;

@end

NS_ASSUME_NONNULL_END

/*
 "status": "OK",
 "copyright": "Copyright (c) 2019 The New York Times Company. All Rights Reserved.",
 "num_results": 542,
 "results": [
 {
    "url": "https://www.nytimes.com/2019/01/05/opinion/sunday/trump-impeachment.html",
    "count_type": "EMAILED",
    "column": null,
    "section": "Opinion",
    "byline": "By DAVID LEONHARDT",
    "title": "The People vs. Donald J. Trump",
    "abstract": "He is demonstrably unfit for office. What are we waiting for?",
    "published_date": "2019-01-05",
    "source": "The New York Times",
    "media": [
        {
        "type": "image",
        "subtype": "photo",
        "caption": "",
        "copyright": "Mike McQuade, photograph by Damon Winter/The New York Times",
        "approved_for_syndication": 1,
        "media-metadata": [
            {
            "url": "https://static01.nyt.com/images/2019/01/06/opinion/sunday/06Leonhardt-Illo/06Leonhardt-Illo-thumbStandard.jpg",
            "format": "Standard Thumbnail",
            "height": 75,
            "width": 75
            },
 */
