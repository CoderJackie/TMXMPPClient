//
//  TMLoginViewController.h
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TMXMPPLoginManager.h"

@interface TMLoginViewController : UIViewController

@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, weak) id<TMXMPPLoginDelegate>delegate;

@end
