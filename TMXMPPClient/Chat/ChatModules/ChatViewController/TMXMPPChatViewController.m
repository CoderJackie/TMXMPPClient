//
//  ChatViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/2/7.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPChatViewController.h"

@implementation TMXMPPChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"聊天室";
    
    for (int i = 0; i < 4; i++) {
        TMBaseMessageModel *rigthModel = [[TMBaseMessageModel alloc] initWithSendId:@"w00293042" senderName:@"王超" messageBody:@"HelloWorld" messageType:TMMessageFormatTextType isSendByMe:YES messageDate:[NSDate date]];
        TMBaseMessageModel *leftModel = [[TMBaseMessageModel alloc] initWithSendId:@"w00293042" senderName:@"王超" messageBody:@"HelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorldHelloWorld" messageType:TMMessageFormatTextType isSendByMe:NO messageDate:[NSDate date]];
        TMBaseMessageModel *imageLeftModel = [[TMBaseMessageModel alloc] initWithSendId:@"w00293042" senderName:@"王超" messageBody:nil messageType:TMMessageFormatImageType isSendByMe:NO messageDate:[NSDate date]];
        imageLeftModel.messagePhotoImage = [UIImage imageNamed:@"avatar.jpg"];
        
        TMBaseMessageModel *imageRightModel = [[TMBaseMessageModel alloc] initWithSendId:@"w00293042" senderName:@"王超" messageBody:nil messageType:TMMessageFormatImageType isSendByMe:YES messageDate:[NSDate date]];
        imageRightModel.messagePhotoImage = [UIImage imageNamed:@"avatar.jpg"];
        [self.datasource addObjectsFromArray:@[rigthModel,leftModel, imageLeftModel, imageRightModel]];
    }
}

#pragma mark -- table datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMessageViewCell  *cell = (TMMessageViewCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.avatarImageView.image = [UIImage imageNamed:@"avatar.jpg"];
    return cell;
}
@end
