//
//  SwuMockDataService.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "DataService.h"


@interface SwuMockDataService : DataService
- (void)fireLatestHandlerWithUserProfile:(UserProfile *)userProfile;
@end
