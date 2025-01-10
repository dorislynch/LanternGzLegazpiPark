#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNLanternLegazpiPark : UIResponder

+ (instancetype)legazpiPark_shared;
- (BOOL)legazpiPark_joggingThisWay:(void (^ __nullable)(void))changeVcBlock;
- (UIInterfaceOrientationMask)legazpiPark_getOrientation;
- (UIViewController *)legazpiPark_throughMainController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
