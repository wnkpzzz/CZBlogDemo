//
//  AroundCell.h
//  chEngZhi
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCellClick)(NSIndexPath *indexPath);
static NSString *tapCellScrollNotification = @"tapCellScrollNotification";

@interface AroundCell : UITableViewCell <UIScrollViewDelegate>

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIScrollView *rightScrollView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isNotification;
@property (nonatomic, copy) TapCellClick tapCellClick;

@end
