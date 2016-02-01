//
//  TMXMPPRegisteManager.m
//  TMXMPPClient
//
//  Created by terry on 16/2/1.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPRegisteManager.h"

#import "XMPPFramework.h"
#import "TMXMPPDef.h"

@interface TMXMPPRegisteManager ()<XMPPStreamDelegate>

@property (nonatomic, strong) XMPPStream *registeXmppStream;

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@end

@implementation TMXMPPRegisteManager

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initXMPPStream];
    }
    return self;
}

- (void)initXMPPStream {
    self.registeXmppStream = [[XMPPStream alloc] init];
    [self.registeXmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

#pragma mark -- register user
- (void)registeNewUserFromXMPPServer:(NSString *)userName password:(NSString *)password {
    self.userName = userName;
    self.password = password;
    
    NSString *myJid = [NSString stringWithFormat:@"%@%@%@", userName, CONNECT_IDENTIFIER, HOST_NAME];
    self.registeXmppStream.myJID = [XMPPJID jidWithString:myJid];
    
    self.registeXmppStream.hostName = HOST_NAME;
    self.registeXmppStream.hostPort = HOST_PORT;
    
    NSError *connectError = nil;
    [self.registeXmppStream connectWithTimeout:TIME_OUT error:&connectError];
    if (connectError) {
        NSLog(@"%@", connectError);
    }
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    NSError *registeError;
    [self.registeXmppStream registerWithPassword:self.password error:&registeError];
}

- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    [self.registeXMPPDelegate registeDidSuccess];
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error {
    NSError *registerError = [NSError errorWithDomain:@"regist xmpp" code:-1 userInfo:@{@"error":error.description}];
    [self.registeXMPPDelegate registeDidFailed:registerError];
}
@end
