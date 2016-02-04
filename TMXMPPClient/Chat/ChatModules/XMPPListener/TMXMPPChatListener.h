//
//  TMXMPPChatListener.h
//  TMXMPPClient
//
//  Created by terry on 16/2/3.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMPPFramework.h"

@interface TMXMPPChatListener : NSObject<XMPPRosterDelegate>

@property (nonatomic, strong) XMPPStream *xmppStream;
@property (nonatomic, strong) XMPPRoster *xmppRoster;

+ (instancetype)sharedInstance;
@end
