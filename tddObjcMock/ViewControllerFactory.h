//
//  ViewControllerFactory.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-06-14.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserProfile;

@interface ViewControllerFactory : NSObject
- (UIViewController *)userProfileViewControllerForUserProfile:(UserProfile *)userProfile;
@end
