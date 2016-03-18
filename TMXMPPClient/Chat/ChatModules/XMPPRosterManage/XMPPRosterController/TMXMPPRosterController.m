//
//  TMXMPPRosterController.m
//  TMXMPPClient
//
//  Created by terry on 16/2/6.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMXMPPRosterController.h"
//数据源
#import "TMXMPPRosterDatasource.h"

//聊天界面
#import "TMXMPPChatViewController.h"

#import "TMXMPPRosterViewCell.h"

#define TMXMPPROSTER_CELL_REUSEIDENTIFIER @"TMXmppRosterCellReuseIdentifier"

@interface TMXMPPRosterController ()
@property (nonatomic, strong) NSMutableArray<TMRosterModel *> *datasource;
@end

@implementation TMXMPPRosterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    
    self.datasource = [NSMutableArray arrayWithArray:[TMXMPPRosterDatasource sharedInstance].datasource];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyRosterDatasourceChanged:) name:@"Notification_Center_RosterChanged" object:nil];
}

- (void)dealloc {
    [[TMXMPPRosterDatasource sharedInstance] removeAllObject];
    NSLog(@"%s method called", __func__);
}

#pragma mark -- init
- (void)initTableView {
    [self.tableView registerNib:[UINib nibWithNibName:@"TMXMPPRosterViewCell" bundle:nil] forCellReuseIdentifier:TMXMPPROSTER_CELL_REUSEIDENTIFIER];
}

#pragma mark -- table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMXMPPRosterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TMXMPPROSTER_CELL_REUSEIDENTIFIER];
    
    TMRosterModel *rosterModel = [self.datasource objectAtIndex:indexPath.row];
    cell.headImageView.image = [UIImage imageNamed:@"avatar.jpg"];
    cell.nickName.text = rosterModel.nickName;
    
    cell.headImageView.layer.cornerRadius = 12;
    return cell;
}

#pragma mark -- table delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    TMRosterModel *rosterModel = [self.datasource objectAtIndex:indexPath.row];
    TMXMPPChatViewController *chatController = [[TMXMPPChatViewController alloc] init];
    chatController.chatWithWho = rosterModel.jidName;
    
    [self.navigationController pushViewController:chatController animated:YES];
}

#pragma mark -- notification logic
- (void)notifyRosterDatasourceChanged:(NSNotification *)notification {
    self.datasource = [NSMutableArray arrayWithArray:[TMXMPPRosterDatasource sharedInstance].datasource];
    [self.tableView reloadData];
}
@end
