//
//  TMXMPPRegisteDelegate.h
//  TMXMPPClient
//
//  Created by terry on 16/2/1.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

@protocol TMXMPPRegisteDelegate <NSObject>

/**
 *  处理注册成功之后的回调
 */
- (void)registeDidSuccess;

/**
 *  处理注册失败之后的回调
 *
 *  @param error NSError
 */
- (void)registeDidFailed:(NSError *)error;
@end

