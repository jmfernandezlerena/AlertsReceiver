//
//  TrackingService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "TrackingService.h"

@implementation TrackingService

/*! INSTANCIA. */
static TrackingService *_sharedInstance;

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
+ (TrackingService *)sharedInstance
{
    if ( ! _sharedInstance )
        _sharedInstance = [[TrackingService alloc] init];
    
    return _sharedInstance;
}

#pragma mark configure
/*!
 CONFIGURAR.
 */
- (void)configure
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"configure"]));
    
    // IDFA.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    tracker.allowIDFACollection = NO;
    // OPCIONAL: ENVIA AUTOMATICAMENTE EXCEPCION NO CONTROLADAS DE NUESTRA APP A GOOGLE.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // OPCIONAL: ESTABLECE UN INTERVALO PARA LA COMUNICACIÓN CON GOOGLE.
    [GAI sharedInstance].dispatchInterval = 20;
    // OPCIONAL: ACIVA EL MODO VERBOSE PARA OBTENER MAS INFORMACION.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelError];
    // CREAR LA INSTANCIA DEL TRACKER INDICANDO EL ID DE SEGUIMIENTO DE LA APP.
    NSDictionary *googleAnalyticsDictonary = (NSDictionary *)[[AlertsPropertyList sharedInstance] objectForKey:@"Google Analytics"];
    NSString *trackingIDStr = [googleAnalyticsDictonary objectForKey:@"Tracking ID"];
    [[GAI sharedInstance] trackerWithTrackingId:trackingIDStr];
}

#pragma mark trackingToViewController:
/*!
 TRACKING A UN VIEW CONTROLLER.
 */
- (void)trackingToViewController:(NSString *)nameViewController
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"trackingToViewController:"]));
    // INSTANCIA TRACKER.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    tracker.allowIDFACollection = YES;
    
    // EL NOMBRE DEL VIEW CONTROLLER PERMANECERÁ FIJO HASTA QUE SE ESTABLEZCA UN NUEVO VALOR.
    [tracker set:kGAIScreenName
           value:nameViewController];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    // LIMPIAR TRACKING.
    [tracker set:kGAIScreenName
           value:nil];
}

#pragma mark tranckingToEventWithCategory:action:label:
/*!
 TRACKING A EVENTO.
 */
- (void)trackingToEventWithCategory:(NSString *)categoryEvent
                             action:(NSString *)action
                              label:(NSString *)label
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"tranckingToEventWithCategory:action:label:"]));
    // INSTANCIA TRACKER.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    tracker.allowIDFACollection = YES;
    
    // ENVIAR EVENTO.
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:categoryEvent
                                                          action:action
                                                           label:label
                                                           value:nil] build]];
}

#pragma mark tranckingToExceptionWithDescription:number:
/*!
 TRACKING A EXCEPTION.
 */
- (void)tranckingToExceptionWithDescription:(NSString *)descriptionException
                                     number:(NSNumber *)numberException
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"tranckingToExceptionWithCategory:number:"]));
    // INSTANCIA TRACKER.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    tracker.allowIDFACollection = YES;
    
    // ENVIAR EVENTO.
    [tracker send:[[GAIDictionaryBuilder createExceptionWithDescription:descriptionException
                                                              withFatal:numberException] build]];
}

@end
