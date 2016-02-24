//
//  LAWTVDeviceViewModel.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LAWTVDevice;

@interface LAWTVDeviceViewModel : NSObject
@property (nonatomic, copy) NSString *deviceID;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, assign, getter=isChecked) BOOL checked;

- (instancetype)initWithTVDevice:(LAWTVDevice *)TVDevice;
@end
