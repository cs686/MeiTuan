//
//  AddressScrollView.m
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "AddressScrollView.h"

@implementation AddressScrollView


+(instancetype)addressScrollView {
    return [[[NSBundle mainBundle] loadNibNamed:@"AddressScrollView" owner:nil options:nil] lastObject];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    
    NSString *path     = [[NSBundle mainBundle]pathForResource:@"citydata.plist" ofType:nil];
    NSArray *cityArray = [NSArray arrayWithContentsOfFile:path];
    //NSLog(@"ssssssssss==%@",cityArray);
    NSArray *cityList  = [cityArray objectAtIndex:14][@"citylist"];
    NSArray *areaCity  = [cityList objectAtIndex:0] [@"arealist"];
    //NSLog(@"%@",areaCity);
    //self.addressScrollView.showsVerticalScrollIndicator = YES;
    self.addressScrollView.alwaysBounceVertical=YES;
    self.addressScrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height-120);
    /**
     *  设置按钮的列数及宽高
     */
    int totalloc = 3;
    CGFloat buttonW=70;
    CGFloat buttonH=30;
    //按钮之间的间距
    CGFloat margin = (self.frame.size.width - totalloc * buttonW)/4;
    /**
     *  添加button按钮
     */
    for (int i=0;i<areaCity.count; i++) {
        NSDictionary *dic    = areaCity[i];
        NSString *titleStr   = dic[@"areaName"];
        int row              = i / totalloc;
        int loc              = i % totalloc;
        CGFloat buttonX      = margin + (margin + buttonW) * loc;
        CGFloat buttonY      = margin + (margin + buttonH) * row;
        UIButton *areaButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        
        [areaButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [areaButton setTitle:titleStr forState:UIControlStateNormal];
        [areaButton addTarget:self action:@selector(areaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.addressScrollView addSubview:areaButton];
    }
}

- (void)areaButtonClick:(UIButton*)button {
    
    if ([self.delegate respondsToSelector:@selector(areaButtonClick:)]) {
        [self.delegate areaButtonClick:button];
    }
    
}

- (IBAction)changeClickButton:(UIButton *)sender {
    
    if ([self.changeCitydelegate respondsToSelector:@selector(changeClickButton:)]) {
        [self.changeCitydelegate changeClickButton:sender];
    }
}
@end
