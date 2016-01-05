//
//  AddressScrollView.h
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  为点击按钮设置代理方法
 */

@protocol AddressScrollViewButtonDelegate <NSObject>

@optional
- (void)areaButtonClick:(UIButton*)button;
@end

@protocol ChangeCityButtonDelegate <NSObject>

@optional

- (void)changeClickButton:(UIButton *)button;

@end


@interface AddressScrollView : UIView


@property (weak, nonatomic) IBOutlet UIScrollView *addressScrollView;
- (IBAction)changeClickButton:(UIButton *)sender;

+ (instancetype)addressScrollView;

@property (nonatomic,strong)id <AddressScrollViewButtonDelegate> delegate;
@property (nonatomic,strong)id <ChangeCityButtonDelegate> changeCitydelegate;

@end
