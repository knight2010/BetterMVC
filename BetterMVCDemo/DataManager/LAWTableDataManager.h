//
//  LAWTableDataManager.h
//  BetterMVCDemo
//
//  Created by lancewer on 2/22/16.
//  Copyright © 2016 lancewer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestSuccessHandler) (NSArray *);
typedef void (^RequestFailHandler) (NSString *);

@interface LAWTableDataManager : NSObject
- (void)requestDataWithParam:(NSDictionary *)param success:(RequestSuccessHandler)successHandler fail:(RequestFailHandler)failedHandler;
@end
