//
//  TMRosterModel.h
//  TMXMPPClient
//
//  Created by terry on 16/2/5.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMRosterModel : NSObject

/**
 *  用于跟服务器通信的前缀
 */
@property (nonatomic, copy) NSString *jidName;

/**
 *  昵称
 */
@property (nonatomic, copy) NSString *nickName;

- (instancetype)initWithJidName:(NSString *)jidName nickName:(NSString *)nickName;
@end
