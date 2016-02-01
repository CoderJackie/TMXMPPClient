//
//  TMXMPPRegisteManager.h
//  TMXMPPClient
//
//  Created by terry on 16/2/1.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TMXMPPRegisteDelegate.h"

@interface TMXMPPRegisteManager : NSObject

@property (nonatomic, weak) id<TMXMPPRegisteDelegate>registeXMPPDelegate;

- (void)registeNewUserFromXMPPServer:(NSString *)userName password:(NSString *)password;
@end
