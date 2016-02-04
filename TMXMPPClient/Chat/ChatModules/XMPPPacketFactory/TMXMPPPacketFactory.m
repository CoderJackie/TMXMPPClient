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
@end
