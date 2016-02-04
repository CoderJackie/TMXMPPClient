//
//  TMXMPPChatListener.m
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPChatListener.h"

#import "TMXMPPPacketFactory.h"

@interface TMXMPPChatListener ()<XMPPStreamDelegate>

@property (nonatomic, strong) XMPPReconnect *xmppReconnectManager;

@end

@implementation TMXMPPChatListener

#pragma mark -- init
+ (instancetype)sharedInstance {
    static TMXMPPChatListener *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

#pragma mark -- xmppstream delegate
- (BOOL)xmppStream:(XMPPStream *)sender didReceiveIQ:(XMPPIQ *)iq {
    
    return YES;
}

- (void)xmppStream:(XMPPStream *)sender didSendIQ:(XMPPIQ *)iq {
    
}

- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message {
    
}

- (void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message {
    
}

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    [TMXMPPPacketFactory sendOnLinePresence:sender];
    [TMXMPPPacketFactory sendFetchRosterIQ:sender];
}
@end
