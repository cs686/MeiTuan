//
//  SelectedAddress.h
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddressScrollView;


@protocol  JFSelectAddressViewTapDelegate <NSObject>
@optional
-(void)removeMaskView;

@end


@interface SelectedAddress : UIView

@property (nonatomic, weak)id <JFSelectAddressViewTapDelegate>delegate;


@property (nonatomic,strong)AddressScrollView *addressScrollView;


@end
