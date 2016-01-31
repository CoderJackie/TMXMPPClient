//
//  XMPPLoginManager.h
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

//处理XMPP相关数据
#import "XMPPFramework.h"

@interface TMXMPPLoginManager : NSObject
+ (instancetype)sharedInstance;

- (void)connectXMPPServer:(NSString *)userName password:(NSString *)password;
@end
