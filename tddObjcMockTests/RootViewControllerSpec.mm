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

xdescribe(@"Loading screen", ^{
    __block RootViewController *subject;
    __block DataService *dataService;
    
    beforeEach(^{
        // dataService =
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:nil];
    });
    subjectAction(^{
        [subject view];
    });
    context(@"when user data not available", ^{
        beforeEach(^{
            
        });
        it(@"should ask the data service to fetch user data", ^{
            
        });
    });
    context(@"when user data available", ^{
        beforeEach(^{
            
        });
        it(@"should use the most recent user data", ^{
            // this test is a little contrived, but that's ok =P
        });
        it(@"should not ask the data service to fetch user data", ^{
            // do we need this test?
        });
    });
});

xdescribe(@"Displaying user info", ^{
    __block RootViewController *subject;
    __block SwuMockDataService *dataService;
    __block ViewControllerFactory *vcFactory;
    __block UIViewController *userProfileViewController;
    
    beforeEach(^{
        // dataService =
        // vcFactory =
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:vcFactory];
        
        [subject view];
    });
    it(@"should embed a user profile view controller", ^{
        
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
