//
//  HomeTableViewCell.h
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLab; 

// 按钮点击事件
@property (copy,nonatomic) void (^backInfoBlock)(UITableViewCell * cell);


+(NSString *)cellID;


@end


