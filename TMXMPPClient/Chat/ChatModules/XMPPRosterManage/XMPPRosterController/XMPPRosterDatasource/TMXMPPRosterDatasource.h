//
//  TMXMPPRosterDatasource.h
//  TMXMPPClient
//
//  Created by terry on 16/2/5.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TMRosterModel.h"

@interface TMXMPPRosterDatasource : NSObject

+ (instancetype)sharedInstance;

- (NSInteger)datasourceCount;

- (NSArray<TMRosterModel *> *)datasource;

- (void)addObject:(TMRosterModel *)object;
@end
