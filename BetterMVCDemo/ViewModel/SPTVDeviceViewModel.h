//
//  SPTVDeviceViewModel.h
//  BetterMVCDemo
//
//  Created by knight on 16/2/28.
//  Copyright © 2016年 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LAWTVDevice;

@interface SPTVDeviceViewModel : NSObject

@property (nonatomic, copy) NSString *deviceID;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *deviceDescription;

- (instancetype)initWithTVDevice:(LAWTVDevice *)TVDevice;

@end
