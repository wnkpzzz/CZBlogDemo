//
//  HeadTableCell.m
//  chEngZhi
//
//  Created by Hans on 2019/3/14.
//  Copyright © 2019年 wnkp. All rights reserved.
//

#import "HeadTableCell.h"
 
@implementation HeadTableCell

+(NSString *)cellID{
    static NSString * const ID = @"HeadTableCell";
    return ID;
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
