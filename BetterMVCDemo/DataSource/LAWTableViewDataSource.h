//
//  LAWTableViewDataSource.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/22/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef void(^ConfigureCell) (UITableViewCell *, id);

typedef void(^ConfigureMultiCell) (NSIndexPath *, id);

@interface LAWTableViewDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCell)configureCellBlock;

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCell)configureCellBlock;

- (instancetype)initconfigureCellBlock:(ConfigureMultiCell)configMultiCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (void)setData:(NSArray *)data;
@end
