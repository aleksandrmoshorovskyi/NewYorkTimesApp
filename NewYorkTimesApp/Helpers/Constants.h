//
//  Constants.h
//  NewYorkTimesApp
//
//  Created by Aleksandr Moroshovskyi on 1/6/19.
//  Copyright © 2019 Aleksandr Moroshovskyi. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef void(^URLComplitionBlock)(id data, NSString *errorMessage);

static NSString *const kBaseURL = @"https://api.nytimes.com";
static NSString *const kPathME_URL = @"/svc/mostpopular/v2/mostemailed/all-sections/1.json";
static NSString *const kApiKey = @"36fbaed80a984d77bf595d34d8316f24";

#endif /* Constants_h */
