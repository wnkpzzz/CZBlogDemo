//
//  Animal.h
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/13.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
 
@interface Animal : NSObject

@property (nonatomic,assign) int age; 

@property (nonatomic, assign) IMP imp;

@property (nonatomic, assign) IMP classImp;

@end

