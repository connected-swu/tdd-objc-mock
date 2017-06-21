//
//  RootViewController.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-05-31.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfileViewController.h"

@class DataService;
@class ViewControllerFactory;

@interface RootViewController : UIViewController
//@property (nonatomic, strong) UserProfileViewController *userProfileViewController;
+ (instancetype)withDataService:(DataService *)dataService
          viewControllerFactory:(ViewControllerFactory *)viewControllerFactory;
@end

