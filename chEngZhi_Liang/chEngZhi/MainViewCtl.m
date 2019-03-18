//
//  MainViewCtl.m
//  chEngZhi
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "MainViewCtl.h"
#import "HeadTableCell.h"

@interface MainViewCtl ()<UITableViewDelegate,UITableViewDataSource>

// UITableView
@property (assign, nonatomic)  NSInteger pageInt;
@property (strong, nonatomic)  UITableView *tableView;
@property (strong, nonatomic)  NSArray *tableItems;

@end
 

@implementation MainViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"课程表";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self initDatas];
    
    [self initTableView];
}

- (void)initDatas{
    
    self.navigationItem.title = @"首页";
    self.tableItems = @[ 
                        @[
                            @[@"早 06:10-07:00",@"语",@"",@"语",@" ",@"" ],
                            ],
                        @[
                            @[@"一 07:50-08:40",@"",@"",@"",@"",@"语" ],
                            @[@"二 08:50-09:40",@"",@"语",@"",@"",@"" ],
                            @[@"三 10:00-10:50",@"",@"",@"",@"",@"" ],
                            @[@"四 11:00-11:50",@"语",@"",@"",@"",@"语" ],
                            ],
                        @[
                            @[@"休 12:20-02:00",@"",@"",@"",@"",@"" ],
                            ],
                        @[
                            @[@"一 02:20-03:10",@"",@"",@"地",@"",@"" ],
                            @[@"二 03:30-04:20",@"",@"地",@"",@"",@"" ],
                            @[@"三 04:30-05:20",@"语",@"",@"语",@" ",@"" ],
                            ],
 
                        @[
                            @[@"自 06:00-08:00",@"",@"",@"",@"",@"语" ],
                            ],
                        ];
  
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 65, APP_WIDTH, APP_HEIGHT - Nav_Height - 65);
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass( [HeadTableCell class] ) bundle:nil] forCellReuseIdentifier:[HeadTableCell cellID]];
    }
    return _tableView;
}

- (void)initTableView{
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {  return 1;  }
    if (section == 1) {  return 4;  }
    if (section == 2) {  return 1;  }
    if (section == 3) {  return 3;  }
    if (section == 4) {  return 1;  }
 
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {  return 35;  }
    if (indexPath.section == 1) {  return 55;  }
    if (indexPath.section == 2) {  return 30;  }
    if (indexPath.section == 3) {  return 55;  }
    if (indexPath.section == 4) {  return 55;  }
    
    return 105 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HeadTableCell * cell = [tableView dequeueReusableCellWithIdentifier:[HeadTableCell cellID]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray * secList = self.tableItems[indexPath.section];
    NSArray * rowList = secList[indexPath.row];
    
    cell.label0.text = rowList[0];
    cell.label1.text = rowList[1];
    cell.label2.text = rowList[2];
    cell.label3.text = rowList[3];
    cell.label4.text = rowList[4];
    cell.label5.text = rowList[5];

    return cell;
}

@end
