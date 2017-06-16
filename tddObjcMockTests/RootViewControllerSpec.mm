#import <Cedar/Cedar.h>
#import "RootViewController.h"
#import "DataService.h"
#import "UserProfile.h"
#import "ViewControllerFactory.h"
#import "UserProfileViewController.h"
#import "SwuMockDataService.h"


@interface MockUserProfileViewController : UserProfileViewController
@end
@implementation MockUserProfileViewController
- (void)updateWithUserProfile:(UserProfile *)userProfile {
    // do nothing
}
@end


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RootViewControllerSpec)

describe(@"Loading screen", ^{
    __block RootViewController *subject;
    __block DataService *dataService;
    
    beforeEach(^{
        dataService = nice_fake_for(DataService.class);
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:nil];
    });
    subjectAction(^{
        [subject view];
    });
    context(@"when user data not available", ^{
        beforeEach(^{
            dataService stub_method(@selector(userProfile)).and_return(nil);
        });
        it(@"should ask the data service to fetch user data", ^{
            dataService should have_received(@selector(fetchUserProfile:));
        });
    });
    context(@"when user data available", ^{
        __block UserProfile *userProfile;
        beforeEach(^{
            userProfile = nice_fake_for(UserProfile.class);
            dataService stub_method(@selector(userProfile)).and_return(userProfile);
        });
        it(@"should use the most recent user data", ^{
            // this test is a little contrived, but that's ok =P
            dataService should have_received(@selector(userProfile));
        });
        it(@"should not ask the data service to fetch user data", ^{
            // do we need this test?
            dataService should_not have_received(@selector(fetchUserProfile:));
        });
    });
});

describe(@"Displaying user info", ^{
    __block RootViewController *subject;
    __block DataService *dataService;
    __block ViewControllerFactory *vcFactory;
    __block UIViewController *userProfileViewController;
    
    beforeEach(^{
        dataService = nice_fake_for(DataService.class);
        
        userProfileViewController = [[UIViewController alloc] init];
        
        vcFactory = fake_for(ViewControllerFactory.class);
        vcFactory stub_method(@selector(userProfileViewControllerForUserProfile:))
            .and_return(userProfileViewController);
        
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:vcFactory];
        
        [subject view];
    });
    it(@"should embed a user profile view controller", ^{
        [subject childViewControllers] should contain(userProfileViewController);
        subject.view.subviews should contain(userProfileViewController.view);
    });
    describe(@"upon completion of user profile fetch", ^{
        // __block UserProfile *fetchedUserProfile;
        
        beforeEach(^{
            
        });
        it(@"should update the user profile view controller when data returns", ^{
            
        });
    });
});


SPEC_END
