//
//  TMXMPPDef.h
//  TMXMPPClient
//
//  Created by terry on 16/2/1.
//  Copyright © 2016年 com.terrylmay. All rights reserved.
//

#ifndef TMXMPPDef_h
#define TMXMPPDef_h

#define LocalOpenfire 1

#if LocalOpenfire

#define HOST_NAME @"127.0.0.1"
#define HOST_PORT 5222
#define CONNECT_IDENTIFIER @"@"

#else

//amazon openfire服务器地址
#define HOST_NAME @"ec2-52-68-82-92.ap-northeast-1.compute.amazonaws.com"
#define HOST_PORT 5222
#define CONNECT_IDENTIFIER @"@"

#endif

#define TMNotificationType_ReceiveNewMessage @"TMNotificationType_ReceiveNewMessage"

#define TIME_OUT 20

#endif /* TMXMPPDef_h */
