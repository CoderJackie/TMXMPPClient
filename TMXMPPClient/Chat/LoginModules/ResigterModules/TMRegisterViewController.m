//
//  TMRegisterViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/2/1.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMRegisterViewController.h"

#import "TMXMPPRegisteManager.h"

@interface TMRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *nickName;

@property (nonatomic, strong) TMXMPPRegisteManager *registeXmppManager;

@end

@implementation TMRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRegisteXMPPManager];
    [self initNavigation];
}

- (void)initRegisteXMPPManager {
    self.registeXmppManager = [[TMXMPPRegisteManager alloc] init];
    self.registeXmppManager.registeXMPPDelegate = self;
}

- (void)initNavigation {
    self.title = @"用户注册";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(registeXMPP:)];
}

- (IBAction)registeXMPP:(id)sender {
    [self.registeXmppManager registeNewUserFromXMPPServer:_userName.text password:_password.text];
}

#pragma mark -- registe xmpp delegate
- (void)registeDidSuccess {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registeDidFailed:(NSError *)error {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册失败" message:[error userInfo].description preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController  addAction:alertAction];
    [alertController showViewController:self sender:NULL];
}

@end
