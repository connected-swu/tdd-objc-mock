#import <Cedar/Cedar.h>
#import "RootViewController.h"
#import "DataService.h"
#import "UserProfile.h"
#import "ViewControllerFactory.h"
#import "UserProfileViewController.h"
#import "SwuMockDataService.h"


@interface SwuMockUserProfileViewController : UserProfileViewController
@end
@implementation SwuMockUserProfileViewController
- (void)updateWithUserProfile:(UserProfile *)userProfile {
    // do nothing
}
@end


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(SwuRootViewControllerSpec)

xdescribe(@"Loading screen", ^{
    __block RootViewController *subject;
    __block DataService *dataService;
    
    beforeEach(^{
        dataService = fake_for(DataService.class);
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:nil];
    });
    subjectAction(^{
        [subject view];
    });
    context(@"when user data not available", ^{
        beforeEach(^{
            dataService stub_method(@selector(userProfile))
            .and_return(nil);
            dataService stub_method(@selector(fetchUserProfile:));
        });
        it(@"should ask the data service to fetch user data", ^{
            dataService should have_received(@selector(fetchUserProfile:));
        });
    });
    context(@"when user data available", ^{
        beforeEach(^{
            dataService stub_method(@selector(userProfile))
            .and_return(nice_fake_for(UserProfile.class));
        });
        it(@"should use the most recent user data", ^{
            dataService should have_received(@selector(userProfile));
        });
    });
});

xdescribe(@"Displaying user info", ^{
    __block RootViewController *subject;
    __block SwuMockDataService *dataService;
    __block ViewControllerFactory *vcFactory;
    __block SwuMockUserProfileViewController *userProfileViewController;
    
    beforeEach(^{
        dataService = [SwuMockDataService new];
        vcFactory = nice_fake_for(ViewControllerFactory.class);
        subject = [RootViewController withDataService:dataService
                                viewControllerFactory:vcFactory];
        
        userProfileViewController = [SwuMockUserProfileViewController new];
        vcFactory stub_method(@selector(userProfileViewControllerForUserProfile:))
        .and_return(userProfileViewController);
        
        // ----- We could also use a spy -----
         spy_on(userProfileViewController);
        [subject view];
    });
    it(@"should embed a user profile view controller", ^{
        subject.childViewControllers should contain(userProfileViewController);
        subject.view.subviews should contain(userProfileViewController.view);
    });
    describe(@"upon completion of user profile fetch", ^{
        __block UserProfile *fetchedUserProfile;
        
        beforeEach(^{
            fetchedUserProfile = nice_fake_for(UserProfile.class);
            [dataService fireLatestHandlerWithUserProfile:fetchedUserProfile];
        });
        it(@"should update the user profile view controller when data returns", ^{
            // ----- Using a spy, we would -----
             userProfileViewController should have_received(@selector(updateWithUserProfile:));
        });
    });
});

SPEC_END
