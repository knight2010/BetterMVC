//
//  LAWTVDevice.m
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import "LAWTVDevice.h"

@implementation LAWTVDevice
- (instancetype)initWithDictionary:(NSDictionary *)deviceInfoDic {
    self = [super init];
    if (self) {
        _deviceID = [deviceInfoDic[@"ID"] integerValue];
        _deviceModel = deviceInfoDic[@"Model"];
        _createDate = deviceInfoDic[@"Date"];
        _cellType   = [deviceInfoDic[@"type"] integerValue];
        _deviceDescription = deviceInfoDic[@"description"];
    }
    
    return self;
}
@end
