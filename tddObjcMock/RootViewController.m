//
//  RootViewController.m
//  tddObjcMock
//
//  Created by cl-dev on 2017-05-31.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "RootViewController.h"
#import "DataService.h"
#import "ViewControllerFactory.h"


@interface RootViewController ()
@property (nonatomic, strong) DataService *dataService;
@property (nonatomic, strong) ViewControllerFactory *viewControllerFactory;
@property (nonatomic, strong) UserProfileViewController *userProfileViewController;
@end


@implementation RootViewController

+ (instancetype)withDataService:(DataService *)dataService
          viewControllerFactory:(ViewControllerFactory *)viewControllerFactory {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootViewController *rootVc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
    rootVc.dataService = dataService;
    rootVc.viewControllerFactory = viewControllerFactory;
    return rootVc;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *profileVC = [self.viewControllerFactory userProfileViewControllerForUserProfile:nil];
    [self embedChildViewController:profileVC];
    self.userProfileViewController = (id)profileVC;
    
    if (!_dataService.userProfile) {
        [_dataService fetchUserProfile:^(UserProfile *profile, NSError *error) {
//            self.userProfileViewController.userProfile = profile;
            [self.userProfileViewController updateWithUserProfile:profile];
        }];
    }
}

#pragma mark - Helpers

- (void)embedChildViewController:(UIViewController *)childViewController {
    if (childViewController) {
        [self addChildViewController:childViewController];
        childViewController.view.frame = self.view.bounds;
        [self.view addSubview:childViewController.view];
        [childViewController didMoveToParentViewController:self];
    }
}

#pragma mark - Swu Solutions

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self embedUserProfileViewController];
//    if (self.dataService.userProfile) {
//        
//    } else {
//        __weak typeof(self)weakSelf = self;
//        [self.dataService fetchUserProfile:^(UserProfile *profile, NSError *error) {
//            [weakSelf.userProfileViewController updateWithUserProfile:profile];
//        }];
//    }
//}
//
//- (void)embedUserProfileViewController {
//    self.userProfileViewController = (id)[self.viewControllerFactory userProfileViewControllerForUserProfile:nil];
//    [self embedChildViewController:self.userProfileViewController];
//}

@end
