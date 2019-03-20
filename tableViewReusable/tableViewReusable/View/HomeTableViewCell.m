//
//  HomeTableViewCell.m
//  kvoAndkvoDemo
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell


+(NSString *)cellID{
    static NSString * const ID = @"HomeTableViewCell";
    return ID;
}


- (IBAction)deleteAction:(id)sender {
    
    if (self.backInfoBlock) {
        self.backInfoBlock(self);
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
