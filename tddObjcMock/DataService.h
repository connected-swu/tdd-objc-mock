//
//  DataService.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProfile.h"


typedef void (^FetchHandler)(UserProfile *profile, NSError *error);

@interface DataService : NSObject
@property (nonatomic, readonly) UserProfile *userProfile;
- (void)fetchUserProfile:(FetchHandler)handler;
@end
