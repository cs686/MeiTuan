//
//  AllCityViewController.m
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "AllCityViewController.h"

static NSString *cid = @"Cell";


@interface AllCityViewController ()


@end

@implementation AllCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self= [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}

- (id)init {
    self=[super init];
    if (self) {
        self.arrayHotCities = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市",  nil];
        self.keys=[NSMutableArray array];
        self.arrayCities = [NSMutableDictionary dictionary];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置Nav
    [self initNav];
    //获取城市数据
    [self getCityData];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //self.navigationItem.title = @"选择城市";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cid];
    
    
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self.view addSubview:self.tableView];
    
}
#pragma mark-设置Nav
- (void)initNav {
    self.title= @"城市列表";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(OnBackBtn)];
    self.navigationItem.leftBarButtonItem=leftItem;
}
- (void)OnBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark-整理数据
-(void)getCityData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"citydict" ofType:@"plist"];
    self.arrayCities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    //self.keys = [[self.arrayCities allKeys] sortedArrayUsingSelector:@selector(compare:)];
    [self.keys addObjectsFromArray:[[self.arrayCities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    //添加热门城市
    NSString *strHot = @"热门城市";
    [self.keys insertObject:strHot atIndex:0];
    [self.arrayCities setObject:_arrayHotCities forKey:strHot];
}

#pragma mark-设置TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.keys.count ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *key = self.keys[section];
    NSArray *nameSection = self.arrayCities[key];
    return nameSection.count;
    
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return self.keys[section];
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.arrayCities[key];
    cell.textLabel.text = nameSection[indexPath.row];
    return cell;
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.keys;
}

@end
