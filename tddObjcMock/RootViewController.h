//
//  RootViewController.h
//  tddObjcMock
//
//  Created by cl-dev on 2017-05-31.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataService;
@class ViewControllerFactory;


@interface RootViewController : UIViewController
+ (instancetype)withDataService:(DataService *)dataService
          viewControllerFactory:(ViewControllerFactory *)viewControllerFactory;
@end

