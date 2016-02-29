//
//  LAWTableViewDataSource.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/22/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTableViewDataSource.h"
//#import <objc/runtime.h>

@interface LAWTableViewDataSource () {
    NSArray *TVDevices;
    NSString *cellID;
    ConfigureCell configureCell;
    ConfigureMultiCell multiCell;
    NSDictionary *  identiDic;
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

- (instancetype)initWithItems:(NSArray *)items configureCellBlock:(ConfigureMultiCell)configureCellBlock {

    self = [super init];
    if (self) {
        TVDevices = items;
        multiCell = configureCellBlock;
        identiDic = nil;
    }
    
    return self;
}

- (instancetype)initWithItems:(NSArray *)items cellIdentifierDic:(NSDictionary *)identifierDic configureCellBlock:(ConfigureCell)configureCellBlock {
    self = [super init];
    if (self) {
        TVDevices = items;
        identiDic = identifierDic;
        configureCell = configureCellBlock;
    }
    
    return self;
}

- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier configureCellBlock:(ConfigureCell)configureCellBlock {
    return  [self initWithItems:@[] cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
}

- (instancetype)initconfigureCellBlock:(ConfigureMultiCell)configMultiCellBlock {
    
    return  [self initWithItems:@[] configureCellBlock:configMultiCellBlock];
}

- (instancetype)initWithIdentifyDic:(NSDictionary *)identifierDic configureCellBlock:(ConfigureCell)configureCellBlock {
    
    return  [self initWithItems:@[] cellIdentifierDic:identifierDic configureCellBlock:configureCellBlock];
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

//有一个优点，ds与cell分离，这样不会暴露cell, 也就可以适配多种cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = nil;
    id item = [self itemAtIndexPath:indexPath];
    //遍历NSDictionary
    
    NSArray *keys;
    int i, count;
    id key, value;
    
    keys = [identiDic allKeys];
    count = [keys count];
    for (i = 0; i < count; i++)
    {
        key = [keys objectAtIndex: i];
        value = [identiDic objectForKey: key];
        NSLog (@"Key: %@ for value: %@", key, value);
        if ([item isKindOfClass:NSClassFromString(value)]) {
            cell = [tableView dequeueReusableCellWithIdentifier:key forIndexPath:indexPath];
        }
    }
    
    configureCell(cell, item);
    return cell;
}

@end
