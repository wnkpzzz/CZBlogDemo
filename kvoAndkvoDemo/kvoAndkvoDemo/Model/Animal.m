//
//  Animal.m
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/13.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "Animal.h"

@implementation Animal

//Animal内部代码实现
- (void)setAge:(int)age{
    _age = age;
    NSLog(@"setAge");
}

- (void)willChangeValueForKey:(NSString *)key{
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey");
}
- (void)didChangeValueForKey:(NSString *)key{
    NSLog(@"didChangeValueForKey == begin");
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey == end");
}

@end
