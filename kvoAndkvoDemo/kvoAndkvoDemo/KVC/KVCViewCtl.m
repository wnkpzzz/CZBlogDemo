//
//  KVCViewCtl.m
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "KVCViewCtl.h"
#import "Animal.h"
#import <objc/runtime.h>

@interface KVCViewCtl ()

@property (nonatomic,strong) Animal * ani;
@property (nonatomic,strong) Animal * ani1;

@end

@implementation KVCViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.ani = [[Animal alloc] init];
    [self.ani setValue:@38 forKey:@"age"];
    [self.ani setValue:@40 forKeyPath:@"_age"];
    NSLog(@"Age的值：%d",self.ani.age);
    NSLog(@"---------------------------------------------------------");

    //    self.ani1 = [[Animal alloc] init];
    //    [self.ani1 setValue:@99 forKeyPath:@"cat.weight"];
    //    NSLog(@"%d",self.ani1.cat.weight);
    
}


 
@end
