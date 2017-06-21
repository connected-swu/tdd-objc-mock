//
//  MockDataService.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "DataService.h"

@interface MockDataService : DataService

@property (nonatomic, strong, readwrite) UserProfile *mockUserProfile;

@property (nonatomic, copy) FetchHandler latestCallback;

@end
