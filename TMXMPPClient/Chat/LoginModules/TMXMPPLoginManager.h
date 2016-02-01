//
//  XMPPLoginManager.h
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

//处理XMPP登录回调
#import "TMXMPPLoginDelegate.h"

//处理XMPP相关数据
#import "XMPPFramework.h"

@interface TMXMPPLoginManager : NSObject

@property (nonatomic, strong) id<TMXMPPLoginDelegate> loginDelegate;

- (void)connectXMPPServer:(NSString *)userName password:(NSString *)password;
@end
