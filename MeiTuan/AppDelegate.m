//
//  AppDelegate.m
//  MeiTuan
//
//  Created by cq on 15/12/17.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate ()<CLLocationManagerDelegate>{
    CLLocationManager *_locationManager;
    CLLocation *_checkLocation;
}




@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupLocationManager];
    
    return YES;
}

- (void)setupLocationManager {
    _locationManager=[[CLLocationManager alloc] init];
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"开始定位");
        _locationManager.delegate=self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        _locationManager.distanceFilter=200.0f;
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8) {
            [_locationManager requestAlwaysAuthorization];
            [_locationManager requestWhenInUseAuthorization];
        }
        [_locationManager startUpdatingLocation];
    }else {
        NSLog(@"定位失败");
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //_checkLocation=locations.lastObject;
    
    NSLog(@"didUpdateToLocation+++");
        //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
        CLLocation *cl = [locations lastObject];
        _latitude = cl.coordinate.latitude;
        _longtitude = cl.coordinate.longitude;
        NSLog(@"纬度--%f",_latitude);
        NSLog(@"经度--%f",_longtitude);
    
    NSLog(@"%@",_checkLocation);
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败");
}

- (void)setipBaiMap {
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager requestAlwaysAuthorization];
        [locationManager requestWhenInUseAuthorization];
        [locationManager startUpdatingLocation];
    }
    _mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [_mapManager start:@"eAcp50tmLVUDFYNAtiH3oiGt"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
