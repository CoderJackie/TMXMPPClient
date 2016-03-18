//
//  TMXMPPRosterDatasource.m
//  TMXMPPClient
//
//  Created by terry on 16/2/5.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPRosterDatasource.h"

@interface TMXMPPRosterDatasource ()
@property (nonatomic, strong) NSMutableArray<TMRosterModel *> *datasource;
@end

@implementation TMXMPPRosterDatasource
+ (instancetype)sharedInstance {
    static TMXMPPRosterDatasource *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
        instance.datasource = [NSMutableArray array];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (NSInteger)datasourceCount {
    return self.datasource.count;
}

- (NSArray<TMRosterModel *> *)datasource {
    return [_datasource copy];
}

- (void)addObject:(TMRosterModel *)object {
    [_datasource addObject:object];
}

- (void)removeAllObject {
    [_datasource removeAllObjects];
}
@end
