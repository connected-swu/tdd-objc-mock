//
//  SwuMockDataService.m
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "SwuMockDataService.h"


@interface SwuMockDataService ()
@property (nonatomic, copy) FetchHandler latestHandler;
@end


@implementation SwuMockDataService

- (void)fireLatestHandlerWithUserProfile:(UserProfile *)userProfile {
    if (self.latestHandler) {
        self.latestHandler(userProfile, nil);
    }
}

- (void)fetchUserProfile:(FetchHandler)handler {
    self.latestHandler = handler;
}

@end
