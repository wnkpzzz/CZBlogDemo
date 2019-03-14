//
//  KVOViewCtl.m
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "KVOViewCtl.h"
#import "Animal.h"
#import <objc/runtime.h>

@interface KVOViewCtl ()

@property (nonatomic,strong) Animal * ani;
@property (nonatomic,strong) Animal * ani1;

@end

@implementation KVOViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.ani = [[Animal alloc] init];
    self.ani1 = [[Animal alloc] init];
    
    self.ani.age = 10;
    
    NSLog(@"添加KVO之前，ani的setAge是 = %p,未添加KVO的ani1的setAge是 = %p",
          [self.ani methodForSelector:@selector(setAge:)],
          [self.ani1 methodForSelector:@selector(setAge:)]);
    
    //    [self printMethonNamesFromClass:object_getClass(self.ani)];
    //    NSLog(@"添加KVO之前，Animal的class是 = %s",object_getClassName(self.ani));
 
    // 添加键值监听
    [self.ani addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
 

    
    NSLog(@"添加KVO之后，ani的setAge是 = %p,未添加KVO的ani1的setAge是 = %p",
          [self.ani methodForSelector:@selector(setAge:)],
          [self.ani1 methodForSelector:@selector(setAge:)]);
    
    //    [self printMethonNamesFromClass:object_getClass(self.ani)];
    //    NSLog(@"添加KVO之后，Animal的class是 = %s",object_getClassName(self.ani));
}

// 点击事件，触发属性修改
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.ani.age += 5;
}

// 获得回调，实时监听属性改变、
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到了%@对象的%@属性由%@变成了%@属性",object,keyPath,change,change);
}

 
// 需要在不使用的时候,移除监听
- (void)dealloc{
    [self.ani removeObserver:self forKeyPath:@"age"];
}



//打印某个类中的所有方法
- (void)printMethonNamesFromClass:(Class)cls{
    
    unsigned int count;
    //获取方法列表
    Method *methodList = class_copyMethodList(cls, &count);
    
    //保存方法名
    NSMutableString *methonNames = @"".mutableCopy;
    
    for (int i = 0; i < count; i++) {
        
        //获取方法
        Method method = methodList[i];
        
        NSString *methodName = NSStringFromSelector(method_getName(method));
        
        [methonNames appendFormat:@"%@", [NSString stringWithFormat:@"%@, ",methodName]];
        
    }
    
    NSLog(@"methonNames = %@",methonNames);
    //c语音创建的list记得释放
    free(methodList);
}


@end
