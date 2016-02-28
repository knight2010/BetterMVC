//
//  LAWTVDevice.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/20/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义适配多种cell的枚举
typedef NS_ENUM(NSInteger , CellType) {
    TypeFirst  = 1,
    TypeSecond = 1<<1,
    TypeThird  = 1<<2,
    TypeUnkown = 1<<3
};

@interface LAWTVDevice : NSObject
@property (nonatomic, assign, readonly) NSInteger deviceID;
@property (nonatomic, assign, readonly) CellType  cellType;
@property (nonatomic, readonly) NSString *deviceModel;
@property (nonatomic, readonly) NSString *deviceDescription;
@property (nonatomic, strong) NSDate *createDate;

- (instancetype)initWithDictionary:(NSDictionary *)deviceInfoDic;
@end
