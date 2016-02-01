//
//  Header.h
//  TMXMPPClient
//
//  Created by terry on 16/1/31.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMXMPPLoginDelegate <NSObject>

/**
 *  处理连接错误的情况
 *
 *  @param connectError NSError
 */
- (void)loginXMPPConnectError:(NSError *)connectError;

/**
 *  处理连接超时情况
 */
- (void)loginXMPPConnectDidTimeout;

/**
 *  处理认证通过情况
 */
- (void)loginXMPPDidAuthenticate;

/**
 *  处理认证没有通过情况
 */
- (void)loginXMPPDidNotAuthenticate;

@end
