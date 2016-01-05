//
//  ViewController.m
//  MeiTuan
//
//  Created by cq on 15/12/17.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "ViewController.h"
#import "SelectedAddress.h"
#import "AddressScrollView.h"
#import "AllCityViewController.h"
#import "HomeScrollView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ChangeCityButtonDelegate,AddressScrollViewButtonDelegate,JFSelectAddressViewTapDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *menuArray;

@property (nonatomic, strong)SelectedAddress *selectAddressView;

@property (nonatomic, strong)UIButton *leftButton;


@end

@implementation ViewController{
    NSMutableArray *_recommentArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    //创建tableView
    HomeScrollView * scroView=[[HomeScrollView alloc]init];
    [self.view addSubview:scroView];
    //创建添加nav
    [self setupNav];
    //下拉刷新
    //初始化数组
    [self ininData];
    //加载城市数据
    [self loadCityData];
}
#pragma mark--初始化tableView;

#pragma mark-加载数据
- (void)ininData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"menuData" ofType:@"plist"];
    self.menuArray = [NSArray arrayWithContentsOfFile:path];
    _recommentArray =[NSMutableArray array];
    //NSLog(@"%@",self.menuArray);
}
#pragma mark- 加载城市数据
- (void)loadCityData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"citydata" ofType:@"plist"];
    NSArray *cityArray = [NSArray arrayWithContentsOfFile:path];
    //NSLog(@"%@",cityArray);
}

#pragma  mark-设置导航条
- (void)setupNav {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton=leftBtn;
    leftBtn.frame = CGRectMake(0, 0, 40, 35);
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_upArrow"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_downArrow"] forState:UIControlStateSelected];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [leftBtn setTitle:@"济南" forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [leftBtn addTarget:self action:@selector(btn_leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    /**
     *  设置地图图标
     */
    UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    mapBtn.frame = CGRectMake(0, 0, 50, 35);
    [mapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(mapBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mapBtn];
    /**
     *  设置搜索栏
     *
     */
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.backgroundImage = [UIImage imageNamed:@"icon_homepage_search"];
    searchBar.placeholder =@"输入商家、品类、商圈";
    self.navigationItem.titleView = searchBar;
    
    //
    self.selectAddressView = [[SelectedAddress alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.selectAddressView.addressScrollView.delegate=self;
    self.selectAddressView.addressScrollView.changeCitydelegate=self;
    self.selectAddressView.delegate=self;
    
    
    [self.view addSubview:self.selectAddressView];
    self.selectAddressView.hidden=YES;
    
    
}

- (void)btn_leftBtnClick:(UIButton *)button {
    NSLog(@"点击我了");
    button.selected = !button.selected;
    self.selectAddressView.hidden=!self.selectAddressView.hidden;
}
/**
 *  实现代理方法
 */
- (void)removeMaskView {
    self.selectAddressView.hidden=!self.selectAddressView.hidden;
}

- (void)areaButtonClick:(UIButton *)button {
    NSLog(@"title=%@",button.currentTitle);
    [self.leftButton setTitle:button.currentTitle forState:UIControlStateNormal];
    self.selectAddressView.hidden = !self.selectAddressView.hidden;
}
- (void) changeClickButton:(UIButton *)button {
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    AllCityViewController *allCity=[[AllCityViewController alloc] init];
    [self.navigationController pushViewController:allCity animated:YES];
}

- (void)mapBtnClick {
    NSLog(@"显示地图");
}

@end
