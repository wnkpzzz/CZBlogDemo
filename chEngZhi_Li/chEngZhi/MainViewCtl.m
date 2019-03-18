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
                            @[@"早 06:00-07:00",@"",@"语",@"",@"语",@"" ],
                            @[@"预 07:30-07:50",@"",@"",@"语",@"",@"语" ],
                            ],
                        @[
                            @[@"一 08:10-08:55",@"语2",@"",@"语12",@"",@"" ],
                            @[@"二 09:05-09:50",@"语1",@"",@"",@"语1",@"" ],
                            @[@"三 10:20-11:05",@"思1",@"",@"",@"",@"语1" ],
                            @[@"四 11:15-12:00",@"思2",@"",@"",@"语2",@"语2" ],
                            ],
                        @[
                            @[@"休 12:30-01:40",@"",@"",@"",@"",@"" ],
                            ],
                        @[
                            @[@"一 01:50-02:35",@"",@"语2",@"思1",@"作",@"语12" ],
                            @[@"二 02:45-03:30",@"",@"",@"",@"文",@"" ],
                            @[@"三 03:40-04:35",@"",@"语1",@"思2",@"阅",@"" ],
                            @[@"四 04:45-05:30",@"",@"阅",@"",@"",@"" ],
                            ],

                        @[
                            @[@"一 06:40-07:20",@"语12",@"",@"思2",@"",@"语12" ],
                            @[@"二 07:30-08:10",@"",@"",@"思1",@"",@"语2" ],
                            @[@"三 08:20-09:00",@"",@"",@"语1",@"",@"" ],
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
    
    if (section == 0) {  return 2;  }
    if (section == 1) {  return 4;  }
    if (section == 2) {  return 1;  }
    if (section == 3) {  return 4;  }
    if (section == 4) {  return 3;  }
 
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
