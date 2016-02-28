//
//  SPTVDeviceViewModel.m
//  BetterMVCDemo
//
//  Created by knight on 16/2/28.
//  Copyright © 2016年 lancewer. All rights reserved.
//

#import "SPTVDeviceViewModel.h"
#import "LAWTVDevice.h"

@interface SPTVDeviceViewModel()

@property (nonatomic, strong) LAWTVDevice *TVDevice;

@end

//一种新的viewModel
@implementation SPTVDeviceViewModel

- (instancetype)initWithTVDevice:(LAWTVDevice *)TVDevice {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _TVDevice = TVDevice;
    return self;
}

- (NSString *)deviceID {
    if (!_deviceID) {
        _deviceID = [NSString stringWithFormat:@"M2016:%@", @(_TVDevice.deviceID)];
    }
    return _deviceID;
}

- (NSString *)deviceName {
    if (!_deviceName) {
        _deviceName = [NSString stringWithFormat:@"SmartTV-%@", _TVDevice.deviceModel];
    }
    
    return _deviceName;
}

- (NSString *)deviceDescription {

    if (!_deviceDescription) {
        _deviceDescription = [NSString stringWithFormat:@"描述-%@", _TVDevice.deviceModel];
    }
    return _deviceDescription;
}


@end
