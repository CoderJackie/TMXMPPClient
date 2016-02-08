//
//  TMXMPPChatListener.m
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPChatListener.h"

#import "TMXMPPPacketFactory.h"

//内存存储联系人数据
#import "TMXMPPRosterDatasource.h"

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
    //result报文
    if ([iq isResultIQ]) {
        NSXMLElement *queryElement = [iq childElement];
        NSArray<NSXMLElement *> *itemArray = [queryElement elementsForName:@"item"];
        
        [itemArray enumerateObjectsUsingBlock:^(DDXMLElement *obj, NSUInteger idx, BOOL *stop) {
            NSString *jidName = [obj attributeForName:@"jid"].stringValue;
            NSString *name = [obj attributeForName:@"name"].stringValue;
//            NSString *subscription = [obj attributeForName:@"subscription"].name;
            TMRosterModel *model = [[TMRosterModel alloc] initWithJidName:jidName nickName:name];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"jidName like %@", model.jidName];
            TMXMPPRosterDatasource *dataSource = [TMXMPPRosterDatasource sharedInstance];
            if (![[dataSource datasource] filteredArrayUsingPredicate:predicate].count) {
                [dataSource addObject:model];
            }
        }];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Notification_Center_RosterChanged" object:nil];
    }
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
