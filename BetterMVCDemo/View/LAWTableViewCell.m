//
//  LAWTableViewCell.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTableViewCell.h"

@interface LAWTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation LAWTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - IBAction Methods

- (IBAction)check:(UIButton *)sender {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(shouldCheckCell:sender:)]) {
            BOOL shouldCheckCell = [self.delegate shouldCheckCell:self sender:sender];
            if (shouldCheckCell) {
                [self setChecked:!_checked];
                [self.delegate didCheckCell:self sender:sender];
            }
        } else {
            [self setChecked:!_checked];
            [self.delegate didCheckCell:self sender:sender];
        }
    }
}

#pragma mark - Getter & Setter
- (void)setChecked:(BOOL)checked {
    _checked = checked;
    if (_checked) {
        [self.checkButton setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    } else {
        [self.checkButton setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
}
@end
