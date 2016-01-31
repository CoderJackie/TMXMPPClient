//
//  TMLoginViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "TMLoginViewController.h"

#import "TMXMPPLoginManager.h"

@interface TMLoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation TMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initLoginView];
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

- (IBAction)connectXMPPServer:(id)sender {
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSLog(@"%@ %@", userName, password);
    [[TMXMPPLoginManager sharedInstance] connectXMPPServer:userName password:password];
}
@end
