#import "RCTAppDelegateHelper.h"
#import <React/RCTBundleURLProvider.h>
#import <CodePush/CodePush.h>
#import "RNLanternLegazpiPark.h"

@implementation RCTAppDelegateHelper

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"NewYorkCity";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

- (UIViewController *)createRootViewController {
  UIViewController *rootViewController = [[RNLanternLegazpiPark legazpiPark_shared] legazpiPark_throughMainController: [UIApplication sharedApplication] withOptions:@{}];
  return rootViewController;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
  return [[RNLanternLegazpiPark legazpiPark_shared] legazpiPark_getOrientation];
}

@end
