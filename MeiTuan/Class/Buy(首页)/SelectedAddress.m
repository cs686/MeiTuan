//
//  SelectedAddress.m
//  MeiTuan
//
//  Created by cq on 15/12/19.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "SelectedAddress.h"
#import "AddressScrollView.h"

@implementation SelectedAddress

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    UIView *maskView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    maskView.tag = 99;
    maskView.backgroundColor=[UIColor clearColor];
    maskView.alpha=0.6;
    [self  addSubview:maskView];
    
    self.addressScrollView =[AddressScrollView addressScrollView];
    self.addressScrollView.frame = CGRectMake(0, 40, self.frame.size.width, self.frame.size.height/2);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewClick)];
    tap.numberOfTapsRequired=1;
    [maskView addGestureRecognizer:tap];
    [self addSubview:_addressScrollView];
}

- (void)maskViewClick {
    
    
    if ([self.delegate respondsToSelector:@selector(removeMaskView)]) {
        [self.delegate removeMaskView];
    }
    
}
@end
