//
//  TMXMPPPacketFactory.h
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMPPStream;

typedef NS_ENUM(NSInteger, TMMessageChatType) {
    TMMessageChatTypeSingle,
    TMMessageChatTypeGroup
};

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

/**
 *  发送文本消息接口
 *
 *  @param xmppStream  XMPPStream
 *  @param messageText NSString
 *  @param toJid 消息接收方
 *  @param chatType 聊天类型
 */
+ (void)sendTextMessage:(XMPPStream *)xmppStream messageText:(NSString *)messageText toJid:(NSString *)toJid messageChatType:(TMMessageChatType)chatType;
@end
