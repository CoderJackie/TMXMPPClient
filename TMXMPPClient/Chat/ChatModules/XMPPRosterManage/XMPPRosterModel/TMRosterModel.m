//
//  TMRosterModel.m
//  TMXMPPClient
//
//  Created by terry on 16/2/5.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMRosterModel.h"

@implementation TMRosterModel

- (instancetype)initWithJidName:(NSString *)jidName nickName:(NSString *)nickName {
    self = [super init];
    
    if (self) {
        self.jidName = jidName;
        self.nickName = nickName;
    }
    
    return self;
}
@end
