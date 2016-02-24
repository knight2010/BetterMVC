//
//  LAWTVDevice.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAWTVDevice : NSObject
@property (nonatomic, assign, readonly) NSInteger deviceID;
@property (nonatomic, readonly) NSString *deviceModel;
@property (nonatomic, strong) NSDate *createDate;

- (instancetype)initWithDictionary:(NSDictionary *)deviceInfoDic;
@end
