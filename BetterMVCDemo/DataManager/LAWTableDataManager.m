//
//  LAWTableDataManager.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/22/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTableDataManager.h"
#import "LAWTVDevice.h"
#import "SPTVDeviceViewModel.h"
#import "LAWTVDeviceViewModel.h"

@implementation LAWTableDataManager
- (void)requestDataWithParam:(NSDictionary *)param success:(RequestSuccessHandler)successHandler fail:(RequestFailHandler)failedHandler {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *data = [self createFakeData];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                successHandler([self constructDeviceModelArray:data]);
            } else {
                failedHandler(@"Request Data Failed");
            }
        });
    });
}

- (NSArray *)createFakeData {
    NSMutableArray *testArrary = [NSMutableArray array];
    for (int i = 0; i< 30 ; i++) {
        NSNumber * type = i % 2 == 1 ? @1:@2;
        NSString *modelStr = [NSString stringWithFormat:@"CHiQ-%@", @(i)];
        [testArrary addObject:@{@"ID":@(i), @"Model": modelStr, @"Date":[NSDate date] ,@"description":modelStr , @"type":type}];
    }
    return [testArrary copy];
}

- (NSArray *)constructDeviceModelArray:(NSArray *)rawInfo {
    NSMutableArray *resultArray = [NSMutableArray array];
    [rawInfo enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LAWTVDevice *device = [[LAWTVDevice alloc] initWithDictionary:obj];
        //关键 分配不同的viewmodel
        if (device.cellType == TypeFirst) {
            LAWTVDeviceViewModel *deviceModel = [[LAWTVDeviceViewModel alloc] initWithTVDevice:device];
            [resultArray addObject:deviceModel];
        }else if (device.cellType == TypeSecond) {
            SPTVDeviceViewModel *deviceModel = [[SPTVDeviceViewModel alloc] initWithTVDevice:device];
            [resultArray addObject:deviceModel];
        }
        
        
    }];
    
    return [resultArray copy];
}
@end
