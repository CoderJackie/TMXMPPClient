//
//  XMPPLoginManager.m
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPLoginManager.h"

#define LocalIM 1

#if LocalIM

#define HOST_NAME @"127.0.0.1"
#define HOST_PORT 5223
#define CONNECT_IDENTIFIER @"@"

#else

#define HOST_NAME @"eim-uat.huawei.com"
#define HOST_PORT 80
#define CONNECT_IDENTIFIER @"@"
#define RESOURCE @"mcloud"

#endif

#define TIME_OUT 20

@interface TMXMPPLoginManager ()<XMPPStreamDelegate, XMPPReconnectDelegate>

@property (nonatomic, strong) XMPPStream *loginXmppStream;
@property (nonatomic, strong) XMPPReconnect *loginReconnectManager;


@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@end

@implementation TMXMPPLoginManager

+ (instancetype)sharedInstance {
    static TMXMPPLoginManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
        [instance initXMPPStream];
        [instance initXMPPReconnect];
    });
    
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initXMPPStream];
        [self initXMPPReconnect];
    }
    return self;
}

- (void)initXMPPStream {
    self.loginXmppStream = [[XMPPStream alloc] init];
    [self.loginXmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

- (void)initXMPPReconnect {
    self.loginReconnectManager = [[XMPPReconnect alloc] init];
    [self.loginReconnectManager activate:self.loginXmppStream];
    // You can also optionally add delegates to the module.
    [self.loginReconnectManager addDelegate:self delegateQueue:dispatch_get_main_queue()];
}

#pragma mark -- connect xmpp method for login viewController
- (void)connectXMPPServer:(NSString *)userName password:(NSString *)password {
    self.userName = userName;
    self.password = password;
    
    NSString *myJid = [NSString stringWithFormat:@"%@%@%@", userName, CONNECT_IDENTIFIER, HOST_NAME];
    self.loginXmppStream.myJID = [XMPPJID jidWithString:myJid];
    
    self.loginXmppStream.hostName = HOST_NAME;
    self.loginXmppStream.hostPort = HOST_PORT;
    
    NSError *connectError = nil;
    [self.loginXmppStream connectWithTimeout:TIME_OUT error:&connectError];
    
    if (connectError) {
        NSLog(@"%@", connectError);
    }
}

#pragma mark -- xmppstream delegate
//连接xmpp成功之后,使用密码认证
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    
    NSError *authError = nil;
    [self.loginXmppStream authenticateWithPassword:self.password error:&authError];
    
    if (authError) {
        NSLog(@"%@", authError);
    }
}

//认证通过之后的处理
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    NSLog(@"%@", @"认证通过");
}

//连接服务器的超时处理
- (void)xmppStreamConnectDidTimeout:(XMPPStream *)sender {
    NSLog(@"连接超时");
}

//认证没有通过处理
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    
}
@end
