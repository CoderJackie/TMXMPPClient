//
//  ChatViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/2/7.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPChatViewController.h"

//常量定义
#import "TMXMPPDef.h"

//报文发送功能类
#import "TMXMPPPacketFactory.h"

//监听报文类
#import "TMXMPPChatListener.h"


@interface TMXMPPChatViewController ()

@property (nonatomic, strong) XMPPStream *xmppStream;

@property (nonatomic, copy) NSString *xmppDomain;
@property (nonatomic, copy) NSString *xmppResource;

@property (nonatomic, copy) NSString *chatWithWhoJid;

@property (nonatomic, copy) NSString *myJidName;
@property (nonatomic, copy) NSString *myJid;
@property (nonatomic, copy) NSString *myNickName;

@end

@implementation TMXMPPChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseChatData];
    [self scrollViewDidScrollToBottom];
    [self initNavigationBar];
}

- (void)dealloc {
    NSLog(@"%s Method called", __func__);
}

- (void)initBaseChatData {
    self.xmppStream = [TMXMPPChatListener sharedInstance].xmppStream;
    self.xmppDomain = self.xmppStream.myJID.domain;
    self.xmppResource = self.xmppStream.myJID.resource;
    
    self.chatWithWhoJid = [NSString stringWithFormat:@"%@@%@", self.chatWithWho, self.xmppDomain];
    self.myJidName = self.xmppStream.myJID.user;
    
    self.myJid = self.xmppStream.myJID.full;
    self.myNickName = self.myJidName;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNewMessageNotification:) name:TMNotificationType_ReceiveNewMessage object:nil];
}

- (void)scrollViewDidScrollToBottom {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.datasource.count - 1) inSection:0];
    if (indexPath.row > 0) {
        [self.messageTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (void)initNavigationBar {
    self.title = self.chatWithWho;
//    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark -- table datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMessageViewCell  *cell = (TMMessageViewCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.avatarImageView.image = [UIImage imageNamed:@"avatar.jpg"];
    return cell;
}

#pragma mark -- TMMessageToolBarDelegate
- (void)didPressedTextViewSendButton:(id)sender text:(NSString *)messageText {
    [self sendTextMessage:messageText toJid:self.chatWithWhoJid messageChatType:TMMessageChatTypeSingle];
}

#pragma mark -- updat chat message UI
- (void)sendTextMessage:(NSString *)messageText toJid:(NSString *)toJid messageChatType:(TMMessageChatType)chatType {
    //发送XMPP报文给对方
    [TMXMPPPacketFactory sendTextMessage:self.xmppStream messageText:messageText toJid:self.chatWithWhoJid messageChatType:TMMessageChatTypeSingle];
    TMBaseMessageViewModel *sendMessageModel = [[TMBaseMessageViewModel alloc] initWithSendId:self.myJid senderName:self.myNickName messageBody:messageText messageType:TMMessageFormatTextType isSendByMe:YES messageDate:[NSDate date]];
    
    [self insertRawAndReloadCellWithModel:sendMessageModel];
}


#pragma mark -- receive new message
- (void)receiveNewMessageNotification:(NSNotification *)notification {
    TMBaseMessageViewModel *model = [notification.userInfo objectForKey:@"message"];
    [self insertRawAndReloadCellWithModel:model];
}

- (void)insertRawAndReloadCellWithModel:(TMBaseMessageViewModel *)messageModel {
    [self.datasource addObject:messageModel];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.datasource.count - 1) inSection:0];
    
    [self.messageTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.messageTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.messageTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}
@end
