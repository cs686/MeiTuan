//
//  HomeScrollView.m
//  MeiTuan
//
//  Created by cq on 15/12/22.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import "HomeScrollView.h"

@implementation HomeScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    self.frame=CGRectMake(0,70 , self.bounds.size.width, 140);
    self.backgroundColor=[UIColor clearColor];
    
//    UIScrollView *homeScroll=[[UIScrollView alloc] initWithFrame:self.frame];
//    homeScroll.backgroundColor=[UIColor greenColor];
//    
//    [self addSubview:homeScroll];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
