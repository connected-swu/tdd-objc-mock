//
//  MockDataService.m
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "MockDataService.h"

@implementation MockDataService


- (void)fetchUserProfile:(FetchHandler)handler {
//    handler(self.mockUserProfile, nil);
    self.latestCallback = handler;
}

@end
