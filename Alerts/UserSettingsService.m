//
//  UserSettingsService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "UserSettingsService.h"
#import "UserSettingsHeader.h"

@implementation UserSettingsService

/*! INSTANCIA. */
static UserSettingsService *_sharedInstance;

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
+ (UserSettingsService *)sharedInstance
{
    if ( ! _sharedInstance )
        _sharedInstance = [[UserSettingsService alloc] init];
    
    return _sharedInstance;
}

#pragma mark updateInstalationSettings
/*!
 CONFIGURAR INSTALACIÓN.
 */
- (void)updateInstalationSettings
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"updateInstalationSettings"]));
    // CONFIGURACIÓN.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // APP.
    
    
    // USER.
    
    // NSUserAppInstalled
    // MARCAR COMO INSTALADO.
    [defaults setBool:YES
               forKey:NSUserAppInstalled];
    
    // SINCRONIZAR.
    [defaults synchronize];
}

@end
