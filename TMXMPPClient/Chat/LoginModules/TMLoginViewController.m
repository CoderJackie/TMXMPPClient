//
//  TMLoginViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMLoginViewController.h"

#import "TMXMPPLoginManager.h"

#import "TMRegisterViewController.h"

@interface TMLoginViewController ()<TMXMPPLoginDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (nonatomic, strong) TMXMPPLoginManager *loginXmppManager;
@end

@implementation TMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initLoginView];
    [self initLoginXMPPManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- init UI
- (void)initLoginView {
    self.headImageView.layer.cornerRadius = 8;
    self.loginButton.layer.cornerRadius = 8;
}

- (void)initLoginXMPPManager {
    self.loginXmppManager = [[TMXMPPLoginManager alloc] init];
}

- (IBAction)connectXMPPServer:(id)sender {
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@ %@", userName, password);
    [self.loginXmppManager connectXMPPServer:userName password:password];
}

- (IBAction)registerNewUser:(id)sender {
    TMRegisterViewController *registerVC = [[TMRegisterViewController alloc] initWithNibName:NSStringFromClass([TMRegisterViewController class]) bundle:nil];
    registerVC.view.frame = [UIScreen mainScreen].bounds;
    [self.navController pushViewController:registerVC animated:YES];
}

#pragma mark -- xmpp login delegate
- (void)loginXMPPDidAuthenticate {
    
}

- (void)loginXMPPConnectDidTimeout {
    
}

- (void)loginXMPPConnectError:(NSError *)connectError {
    
}

- (void)loginXMPPDidNotAuthenticate {
    
}
@end
