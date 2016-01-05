//
//  HotCityCellView.h
//  MeiTuan
//
//  Created by cq on 15/12/20.
//  Copyright © 2015年 顺苹亓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCityCellView : UITableViewCell

+ (instancetype)cellWithTableCellView:(UITableView*)tableView hotCityArray:(NSArray*)hotCityArray;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hotCityArray:(NSArray*)hotCityArray;


@end
