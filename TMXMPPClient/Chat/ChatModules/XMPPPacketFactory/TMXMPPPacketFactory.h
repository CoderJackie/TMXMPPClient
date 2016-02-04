//
//  TMXMPPPacketFactory.h
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMPPStream;

@interface TMXMPPPacketFactory : NSObject

/**
 *  发送上线(出席) 报文,告诉服务器 我已经上线
 *
 *  @param xmppStream XMPPStream
 */
+ (void)sendOnLinePresence:(XMPPStream *)xmppStream;

/**
 *  发送获取好友IQ请求(当然我们也可以通过XMPPRoster fetchRoster来获取)
 *
 *  @param xmppStream XMPPStreawm
 */
+ (void)sendFetchRosterIQ:(XMPPStream *)xmppStream;
@end
