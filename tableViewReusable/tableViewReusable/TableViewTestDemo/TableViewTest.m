//
//  TableViewTest.m
//  tableViewReusable
//
//  Created by Hans on 2019/3/20.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "TableViewTest.h"
#import "HomeTableViewCell.h"


@interface TableViewTest ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * tableItems;

@end

@implementation TableViewTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"] ;
    [self.view addSubview:self.tableView];
  
}

-(void)loadInitDatas{
    
    // 使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(50,50,100,100)];
    imageView.image=[UIImage imageNamed:@"myImg"];
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    maskLayer.frame=imageView.bounds;
    maskLayer.path=maskPath.CGPath;
    imageView.layer.mask=maskLayer;
    [self.view addSubview:imageView];
    
    // 使用CAShapeLayer和UIBezierPath设置圆角
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(250, 250, 100, 100)];
    imageView1.image = [UIImage imageNamed:@"myImg"];
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView1.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView1.bounds cornerRadius:imageView1.frame.size.width] addClip];
    [imageView1 drawRect:imageView1.bounds];
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView1];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45 ;
}

//返回每一组的每一行显示什么内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 定义一个重用标示,用static修饰。就放在了内存的静态区了。
    static NSString *identifier = @"Cell";
    
    // 缓存池中寻找是否有可以重用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 如果缓存池中没有ID，创建一个cell，并给它一个重用标示
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    // 设置数据，赋值给cell
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.textLabel.text = @"123123";
}

#pragma mark - 懒加载
- (NSMutableArray *)tableItems
{
    if (_tableItems == nil) {
        _tableItems = [NSMutableArray array];
    }
    return _tableItems;
}

@end
