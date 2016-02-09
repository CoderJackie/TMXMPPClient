//
//  ChatViewController.h
//  TMXMPPClient
//
//  Created by terry on 16/2/7.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <TMMessageKit/TMMessageKit.h>

//XMPP报文
#import "XMPPFramework.h"

@interface TMXMPPChatViewController : TMMessageViewController

@property (nonatomic, strong, readonly) XMPPStream *xmppStream;

@property (nonatomic, copy) NSString *chatWithWho;

@end
