//
//  LAWViewController.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWViewController.h"
#import "LAWTableViewCell.h"
#import "LAWTableViewDataSource.h"
#import "LAWTVDeviceViewModel.h"
#import "LAWTableDataManager.h"

static NSString *const CELL_ID = @"TestCell";


@interface LAWViewController ()<UITableViewDelegate, LAWCellCheckDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) LAWTableViewDataSource *tableDataSource;
@property (nonatomic, strong) LAWTableDataManager *dataManager;
@property (nonatomic, copy) ConfigureCell configureCell;
@end

@implementation LAWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"LAWTableViewCell" bundle:nil] forCellReuseIdentifier:CELL_ID];
    
    __weak LAWViewController *weakSelf = self;
    self.configureCell = ^(UITableViewCell *cell, id item) {
        LAWTableViewCell *tableCell = (LAWTableViewCell *)cell;
        LAWTVDeviceViewModel *deviceModel = (LAWTVDeviceViewModel *)item;
        tableCell.deviceNameLabel.text = deviceModel.deviceName;
        tableCell.createDateLabel.text = deviceModel.createDate;
        tableCell.checked = deviceModel.isChecked;
        tableCell.delegate = weakSelf;
    };
    
    self.tableDataSource = [[LAWTableViewDataSource alloc] initWithCellIdentifier:CELL_ID configureCellBlock:self.configureCell];
    self.tableView.dataSource = self.tableDataSource;
    
    self.dataManager = [[LAWTableDataManager alloc] init];
    [self.dataManager requestDataWithParam:@{} success:^(NSArray *data) {
        [self.tableDataSource setData:data];
        [self.tableView reloadData];
    } fail:^(NSString *failInfo) {
        NSLog(@"Error");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
