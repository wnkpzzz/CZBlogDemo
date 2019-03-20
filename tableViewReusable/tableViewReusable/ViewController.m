//
//  ViewController.m
//  tableViewReusable
//
//  Created by Hans on 2019/3/20.
//  Copyright © 2019年 wnkp. All rights reserved.
//


#import "ViewController.h"
#import "HomeTableViewCell.h"
 

// 系统高度
#define APP_WIDTH                    [[UIScreen mainScreen] bounds].size.width
#define APP_HEIGHT                   [[UIScreen mainScreen] bounds].size.height
#define Tab_Height                   49
#define Nav_Height                   64

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

// UITableView
@property (assign, nonatomic)  NSInteger pageInt;
@property (strong, nonatomic)  UITableView *tableView;
@property (strong, nonatomic)  NSArray *tableItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    
    [self initDatas];
    [self initTableView];
    
}

- (void)initDatas{
    
    self.navigationItem.title = @"首页";
    self.tableItems = @[
                        @{@"模块一":@[
                                  @{@"KVO测试":@"KVOViewCtl"},
                                  @{@"KVC测试":@"KVCViewCtl"}
                                  ]
                          }
                        ];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT - Tab_Height);
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass( [HomeTableViewCell class] ) bundle:nil] forCellReuseIdentifier:[HomeTableViewCell cellID]];
    }
    return _tableView;
}

- (void)initTableView{
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.tableItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[self.tableItems objectAtIndex:section] allValues].firstObject count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 40)];
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.text = [[self.tableItems objectAtIndex:section] allKeys].firstObject;
    label.numberOfLines = 1;
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin.x = 15;
    frame.origin.y = header.bounds.size.height - frame.size.height;
    label.frame = frame;
    [header addSubview:label];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell cellID]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *rows = [[self.tableItems objectAtIndex:indexPath.section] allValues].firstObject;
    NSString *className = [[rows objectAtIndex:indexPath.row] allValues].firstObject;
    NSString *title = [[rows objectAtIndex:indexPath.row] allKeys].firstObject;
    
    cell.leftLab.text = [NSString stringWithFormat:@"%@-->%@",title,className];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *rows = [[self.tableItems objectAtIndex:indexPath.section] allValues].firstObject;
    NSString *className = [[rows objectAtIndex:indexPath.row] allValues].firstObject;
    NSString *title = [[rows objectAtIndex:indexPath.row] allKeys].firstObject;
    
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    
    subViewController.title = title;
    
    [self.navigationController pushViewController:subViewController animated:YES];
}

@end


