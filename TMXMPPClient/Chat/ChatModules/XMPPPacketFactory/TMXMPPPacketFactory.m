//
//  TMXMPPPacketFactory.m
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPPacketFactory.h"

#import "TMXMPPChatListener.h"
#import "XMPPFramework.h"

@implementation TMXMPPPacketFactory

+ (void)sendOnLinePresence:(XMPPStream *)xmppStream {
    XMPPPresence *onLinePresence = [XMPPPresence presence];
    [xmppStream sendElement:onLinePresence];
}

/* 
<iq type="get">
   <query xmlns="jabber:iq:roster"/>
</iq>
*/
+ (void)sendFetchRosterIQ:(XMPPStream *)xmppStream {
    NSXMLElement *query = [NSXMLElement elementWithName:@"query" xmlns:@"jabber:iq:roster"];
    
    XMPPIQ *iq = [XMPPIQ iqWithType:@"get" elementID:[xmppStream generateUUID]];
    [iq addChild:query];
    
    [xmppStream sendElement:iq];
}

+ (void)sendTextMessage:(XMPPStream *)xmppStream messageText:(NSString *)messageText toJid:(NSString *)toJid messageChatType:(TMMessageChatType)chatType {
    
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:messageText];
    
    NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
    NSString *chatTypeFormat = (chatType == TMMessageChatTypeSingle ? @"chat" : @"groupchat");
    
    [message addAttributeWithName:@"type" stringValue:chatTypeFormat];
    
    [message addAttributeWithName:@"to" stringValue:toJid];
    [message addChild:body];
    
    [xmppStream sendElement:message];
}
@end
