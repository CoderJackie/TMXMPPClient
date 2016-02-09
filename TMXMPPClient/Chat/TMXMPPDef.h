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

#define TMNotificationType_ReceiveNewMessage @"TMNotificationType_ReceiveNewMessage"

#define TIME_OUT 20

#endif

#endif /* TMXMPPDef_h */
