//
//  LAWViewController.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWViewController.h"
#import "LAWTableViewCell.h"
#import "SPTableViewCell.h"
#import "LAWTableViewDataSource.h"
#import "LAWTVDeviceViewModel.h"
#import "SPTVDeviceViewModel.h"
#import "LAWTableDataManager.h"

static NSString *const CELL_ID = @"TestCell";
static NSString *const CELL_SP_ID = @"SPTableViewCell";


@interface LAWViewController ()<UITableViewDelegate, LAWCellCheckDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LAWTableViewDataSource *tableDataSource;
@property (nonatomic, strong) LAWTableDataManager *dataManager;
@property (nonatomic, copy) ConfigureCell configureCell;
@property (nonatomic, copy) ConfigureMultiCell configMultiCell;
@end

@implementation LAWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LAWTableViewCell" bundle:nil] forCellReuseIdentifier:CELL_ID];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SPTableViewCell" bundle:nil] forCellReuseIdentifier:CELL_SP_ID];
    
    __weak LAWViewController *weakSelf = self;
    self.configureCell = ^(UITableViewCell *cell, id item) {
        NSIndexPath * indexPath;
        //判断item是属于哪一种类型
        if ([item isKindOfClass:[LAWTVDeviceViewModel class]]) {
            LAWTableViewCell *tableCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
            LAWTVDeviceViewModel *deviceModel = (LAWTVDeviceViewModel *)item;
            tableCell.deviceNameLabel.text = deviceModel.deviceName;
            tableCell.createDateLabel.text = deviceModel.createDate;
            tableCell.checked = deviceModel.isChecked;
            tableCell.delegate = weakSelf;
        }else if ([item isKindOfClass:[SPTVDeviceViewModel class]]) {
            SPTableViewCell *tableCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:CELL_SP_ID forIndexPath:indexPath];
            SPTVDeviceViewModel *deviceModel = (SPTVDeviceViewModel *)item;
            tableCell.nameLabel.text = deviceModel.deviceName;
            tableCell.descLabel.text = deviceModel.deviceDescription;
            //tableCell.delegate = weakSelf;
        }else {
            NSLog(@"其他情况");
        }
    };
    
    self.configMultiCell = ^(NSIndexPath * indexPath, id item) {
        
        if ([item isKindOfClass:[LAWTVDeviceViewModel class]]) {
            LAWTableViewCell *tableCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
            LAWTVDeviceViewModel *deviceModel = (LAWTVDeviceViewModel *)item;
            tableCell.deviceNameLabel.text = deviceModel.deviceName;
            tableCell.createDateLabel.text = deviceModel.createDate;
            tableCell.checked = deviceModel.isChecked;
            tableCell.delegate = weakSelf;
        }else if ([item isKindOfClass:[SPTVDeviceViewModel class]]) {
            SPTableViewCell *tableCell = [weakSelf.tableView dequeueReusableCellWithIdentifier:CELL_SP_ID forIndexPath:indexPath];
            SPTVDeviceViewModel *deviceModel = (SPTVDeviceViewModel *)item;
            tableCell.nameLabel.text = deviceModel.deviceName;
            tableCell.descLabel.text = deviceModel.deviceDescription;
            //tableCell.delegate = weakSelf;
        }else {
            NSLog(@"其他情况");
        }
    };
    //如何处理 不同的dataSource里面的不同reuseid
    self.tableDataSource = [[LAWTableViewDataSource alloc] initWithCellIdentifier:CELL_ID configureCellBlock:self.configureCell];
    self.tableView.dataSource = self.tableDataSource;
    
    self.dataManager = [[LAWTableDataManager alloc] init];
    /**
     *  处理网络请求使用block回调是一种不错的方式
     */
    [self.dataManager requestDataWithParam:@{} success:^(NSArray *data) {
        [self.tableDataSource setData:data];
        [self.tableView reloadData];
    } fail:^(NSString *failInfo) {
        NSLog(@"Error");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - LAWCellCheckDelegate

- (BOOL)shouldCheckCell:(LAWTableViewCell *)cell sender:(UIButton *)sender {
    if (cell.checked) {
        //change to NO then you can't uncheck the checked cell
        return YES;
    }
    
    return YES;
}

- (void)didCheckCell:(UITableViewCell *)cell sender:(UIButton *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    id item = [self.tableDataSource itemAtIndexPath:indexPath];
    LAWTVDeviceViewModel *deviceModel = (LAWTVDeviceViewModel *)item;
    deviceModel.checked = !deviceModel.isChecked;
}

@end
