//
//  LAWTableViewCell.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LAWTableViewCell;

@protocol LAWCellCheckDelegate <NSObject>
@required
- (void)didCheckCell:(LAWTableViewCell *)cell sender:(UIButton *)sender;
@optional
- (BOOL)shouldCheckCell:(LAWTableViewCell *)cell sender:(UIButton *)sender;
@end

@interface LAWTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *createDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (nonatomic, assign, getter=isChecked) BOOL checked;
@property (nonatomic, weak) id<LAWCellCheckDelegate> delegate;
@end
