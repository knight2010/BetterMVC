//
//  LAWTVDeviceViewModel.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTVDeviceViewModel.h"
#import "LAWTVDevice.h"

@interface LAWTVDeviceViewModel()
@property (nonatomic, strong) LAWTVDevice *TVDevice;
@end

@implementation LAWTVDeviceViewModel
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
        _deviceID = [NSString stringWithFormat:@"%@", @(_TVDevice.deviceID)];
    }
    return _deviceID;
}

- (NSString *)deviceName {
    if (!_deviceName) {
        _deviceName = [NSString stringWithFormat:@"CHiQ-%@", _TVDevice.deviceModel];
    }
    
    return _deviceName;
}

- (NSString *)createDate {
    if (!_createDate) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy MM dd"];
        _createDate = [dateFormatter stringFromDate:_TVDevice.createDate];
    }
    
    return _createDate;
}
@end
