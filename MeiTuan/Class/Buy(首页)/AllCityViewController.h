//
//  AllCityViewController.h
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllCityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *cities;
@property (nonatomic,strong) NSMutableArray *keys;//城市首字母
@property (nonatomic,strong) NSMutableDictionary *arrayCities;
@property (nonatomic,strong) NSMutableArray *arrayHotCities;

@property (nonatomic,strong) UITableView    *tableView;


@end
