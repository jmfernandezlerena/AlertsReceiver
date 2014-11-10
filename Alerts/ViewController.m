//
//  ViewController.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 7/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "ViewController.h"
#import "TrackingService.h"
#import "AlertsUI.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma NAVEGACIÓN.

#pragma mark prepareForSegue:sender:
/*!
 PREPARAR PARA IR A LA SIGUIENTE PANTALLA.
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"prepareForSegue:sender:"]));
    
    // PREPARAR LA SIGUIENTE PANTALLA.
}

#pragma CICLO DE VIDA.

#pragma mark viewDidLoad
/*!
 DESPUÉS VISTA CARGADA.
 */
- (void)viewDidLoad
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewDidLoad"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewDidLoad];
        
        // TRACKING PANTALLA.
        [[TrackingService sharedInstance] trackingToViewController:kTrackingToHomeViewController];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark viewWillAppear:
/*!
 ANTES VISTA APERECIDA.
 */
- (void)viewWillAppear:(BOOL)animated
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewWillAppear:"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewWillAppear:animated];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark viewDidAppear:
/*!
 DESPUÉS VISTA APERECIDA.
 */
- (void)viewDidAppear:(BOOL)animated
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewDidAppear:"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewDidAppear:animated];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark viewWillDisappear:
/*!
 ANTES VISTA DESAPARECIDA.
 */
- (void)viewWillDisappear:(BOOL)animated
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewWillDisappear:"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewWillDisappear:animated];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark viewDidDisappear:
/*!
 DESPUÉS VISTA DESAPARECIDA.
 */
- (void)viewDidDisappear:(BOOL)animated
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewDidDisappear:"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewDidDisappear:animated];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark willRotateToInterfaceOrientation:duration:
/*!
 CAMBIO DE ORIENTACIÓN.
 */
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"willRotateToInterfaceOrientation:duration:"]));
    @try
    {
        if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
            // LANDSCAPE LEFT.
            DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"willRotateToInterfaceOrientation:duration: >> Landscape left"]));
        } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
            // LANDSCAPE RIGHT.
            DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"willRotateToInterfaceOrientation:duration: >> Landscape right"]));
        } else if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
            // PORTRAIT.
            DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"willRotateToInterfaceOrientation:duration: >> Portrait"]));
        } else if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
            // UPSIDE DOWN.
            DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"willRotateToInterfaceOrientation:duration: >> Upside down"]));
        }
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark didReceiveMemoryWarning
/*!
 RECIBIR ADVERTENCIA DE MEMORIA.
 */
- (void)didReceiveMemoryWarning
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"didReceiveMemoryWarning"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super didReceiveMemoryWarning];
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma mark viewDidUnload
/*!
 DESPUÉS DESCARGAR DE VISTA.
 */
- (void)viewDidUnload
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"viewDidUnload"]));
    @try
    {
        // MÉTODO HEREDADO.
        [super viewDidUnload];
        
        // OBJETOS A NIL.
    }
    @catch (NSException *exception)
    {
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [exception reason]]));
        // MOSTRAR ALERTA A USUARIO.
        NSDictionary *userInfoDictonary = [exception userInfo];
        NSString *msgStr = [userInfoDictonary objectForKey:@"UserMessage"];
        [AlertsUI showAlertError:msgStr];
        // TRACKING EXEPTION.
        [[TrackingService sharedInstance] tranckingToExceptionWithDescription:[exception reason]
                                                                       number:[NSNumber numberWithInt:kTrackingToHomeExceptionNumber]];
    }
    @finally
    {
        
    }
}

#pragma MÉTODOS PRIVADOS.

#pragma DELEGACIONES.

#pragma ACCIONES.

#pragma OBSERVADOR DE NOTIFICACIONES.

@end
