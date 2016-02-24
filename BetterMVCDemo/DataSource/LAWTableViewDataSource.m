//
//  LAWTableViewDataSource.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/22/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTableViewDataSource.h"

@interface LAWTableViewDataSource () {
    NSArray *TVDevices;
    NSString *cellID;
    ConfigureCell configureCell;
}
@end

@implementation LAWTableViewDataSource

- (instancetype)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCell)configureCellBlock {
    self = [super init];
    if (self) {
        TVDevices = items;
        cellID = cellIdentifier;
        configureCell = configureCellBlock;
    }
    
    return self;
}

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCell)configureCellBlock {
    return  [self initWithItems:@[] cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
}

#pragma mark - Public Method

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return TVDevices[indexPath.row];
}

- (void)setData:(NSArray *)data {
    TVDevices = data;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return TVDevices.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    configureCell(cell, item);
    return cell;
}

@end