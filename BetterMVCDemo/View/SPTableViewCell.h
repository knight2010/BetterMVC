//
//  SPTableViewCell.h
//  BetterMVCDemo
//
//  Created by knight on 16/2/28.
//  Copyright © 2016年 lancewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTableViewCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UILabel *nameLabel;
@property(weak,nonatomic) IBOutlet UILabel *descLabel;

@end
