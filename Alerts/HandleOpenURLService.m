//
//  HandleOpenURLService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "HandleOpenURLService.h"

@implementation HandleOpenURLService

/*! INSTANCIA. */
static HandleOpenURLService *_sharedInstance;

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
+ (HandleOpenURLService *)sharedInstance
{
    if ( ! _sharedInstance )
        _sharedInstance = [[HandleOpenURLService alloc] init];
    
    return _sharedInstance;
}

#pragma mark application:handleOpenURL:
/*!
 PETICIÓN DE SERVICIO DESDE OTRA APP.
 */
- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:handleOpenURL:"]));
    return YES;
}

#pragma mark checkLaunchOptionsURLKey:
/*!
 COMPROBAR LA LLAMADA DE OTRA APP.
 */
- (void)checkLaunchOptionsURLKey:(NSDictionary *)launchOptions
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:handleOpenURL:"]));
    
}

@end
