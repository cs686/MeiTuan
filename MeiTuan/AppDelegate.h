//
//  AppDelegate.h
//  MeiTuan
//
//  Created by cq on 15/12/17.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapView.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate,BMKMapViewDelegate,CLLocationManagerDelegate>{
    BMKMapManager *_mapManager;
}


@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,assign)double latitude;
@property (nonatomic,assign)double longtitude;


@end

