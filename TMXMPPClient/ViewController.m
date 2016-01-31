//
//  ViewController.m
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import "ViewController.h"

#import "TMLoginViewController.h"

@interface ViewController ()
@property (nonatomic, strong) TMLoginViewController *loginViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initLoginViewController];
    [self.view addSubview:self.loginViewController.view];
}

- (void)initLoginViewController {
    self.loginViewController = [[TMLoginViewController alloc] initWithNibName:@"TMLoginViewController" bundle:nil];
    self.loginViewController.view.frame = [UIScreen mainScreen].bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
