//
//  LoggingService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 26/08/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "LoggingService.h"

@implementation LoggingService

/*! INSTANCIA. */
static LoggingService *_sharedInstance;

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
+ (LoggingService *)sharedInstance
{
    if ( ! _sharedInstance )
        _sharedInstance = [[LoggingService alloc] init];
    
    return _sharedInstance;
}

#pragma mark configure
/*!
 CONFIGURAR.
 */
-(void)configure
{
    // CONFIGURAR CocoaLumberjack.
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // INICIALIZAR FICHERO DE LOGGER.
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    
    // CONFIGURAR EL FICHERO DE LOGGER.
    [fileLogger setMaximumFileSize:(1024 * 1024)];
    [fileLogger setRollingFrequency:(3600.0 * 24.0)];
    [[fileLogger logFileManager] setMaximumNumberOfLogFiles:7];
    [DDLog addLogger:fileLogger];
}

@end
