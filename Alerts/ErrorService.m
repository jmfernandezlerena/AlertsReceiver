//
//  ErrorService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "ErrorService.h"

@implementation ErrorService

/*! INSTANCIA. */
static ErrorService *_sharedInstance;

#pragma CICLO DE VIDA.

#pragma mark init
/*!
 CONSTRUCTOR.
 */
- (id)init
{
    self = [super init];
    if (self) {
        _sharedInstance = self;
    }
    return self;
}

#pragma MÉTODOS PÚBLICOS.

#pragma mark sharedInstance
/*!
 INSTANCIA
 */
+ (ErrorService *)sharedInstance
{
    if ( ! _sharedInstance ) {
        _sharedInstance = [[ErrorService alloc] init];
    }
    return _sharedInstance;
}

#pragma mark valueMsgForUserInfo:
/*!
 MENSAJE DE ERROR.
 */
- (NSDictionary *)valueMsgForUserInfo:(NSDictionary *)userInfo
{
    NSString *msgStr = NSLocalizedString(@"Unexpected error", nil);
    if (userInfo)
    {
        NSEnumerator *enumerator = [userInfo keyEnumerator];
        for (NSString *key in enumerator)
        {
            if ([key isEqualToString:@"NSDebugDescription"])
                // ERROR JSON.
            {
                msgStr = [userInfo objectForKey:@"NSDebugDescription"];
                break;
            }
            else if ([key isEqualToString:@"NSLocalizedDescription"])
                // ERROR AFNERWORKING.
            {
                msgStr = [userInfo objectForKey:@"NSLocalizedDescription"];
                break;
            }
            else if ([key isEqualToString:@"NSException"])
                // ERROR AFNERWORKING.
            {
                msgStr = [userInfo objectForKey:@"NSException"];
                break;
            } else if ([key isEqualToString:@"UserMessage"])
                // MENSAJE DE USUARIO SI SE HA CREADO YA.
            {
                msgStr = [userInfo objectForKey:@"UserMessage"];
                break;
            }
        }
    }
    NSDictionary *userInfoMsg = @{@"UserMessage": msgStr};
    return userInfoMsg;
}

@end
