//
//  LAWTVDeviceSpec.m
//  BetterMVCDemo
//
//  Created by knight on 16/2/29.
//  Copyright © 2016年 lancewer. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LAWTVDevice.h"
SPEC_BEGIN(LAWTVDeviceSpec)
describe(@"LAWTVDevice", ^{
    context(@"When init with an nil dictionary", ^{
        __block LAWTVDevice *TVDevice;
        beforeAll(^{
            TVDevice = [[LAWTVDevice alloc] initWithDictionary:nil];
        });
        
        afterAll(^{
            TVDevice = nil;
        });
        
        it(@"should not be nil", ^{
            [[TVDevice shouldNot] beNil];
        });
        
        it(@"all properties should be default value", ^{
            [[theValue(TVDevice.deviceID) should] equal:theValue(0)];
            [[TVDevice.deviceModel should] beNil];
            [[TVDevice.createDate should] beNil];
        });
    });
    
    context(@"When init with an valid dictionary", ^{
        __block LAWTVDevice *TVDevice;
        beforeAll(^{
            NSDictionary *rawInfoDict = @{@"ID":@(1), @"Model": @"5520", @"Date":[NSDate date]};
            TVDevice = [[LAWTVDevice alloc] initWithDictionary:rawInfoDict];
        });
        
        afterAll(^{
            TVDevice = nil;
        });
        
        it(@"should not be nil", ^{
            [[TVDevice shouldNot] beNil];
        });
        
        it(@"should have all properties be set", ^{
            [[theValue(TVDevice.deviceID) should] equal:theValue(1)];
            [[TVDevice.deviceModel should] beNonNil];
            [[TVDevice.deviceModel should] equal:@"5520"];
            [[TVDevice.createDate should] beNonNil];
            [[TVDevice.createDate should] beLessThanOrEqualTo:[NSDate date]];
        });
    });
});
SPEC_END
