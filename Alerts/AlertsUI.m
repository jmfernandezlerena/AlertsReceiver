//
//  AlertsUI.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 7/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "AlertsUI.h"
#import <UIKit/UIKit.h>

@implementation AlertsUI

#pragma mark showAlertError:
/*!
 MOSTRAR ALERTA DE ERROR.
 */
+ (void)showAlertError:(NSString *)messageStr
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\"%@\"", NSLocalizedString(@"Alerts Receiver", nil)]
                                                    message:messageStr
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark showAlertInformation:
/*!
 MOSTRAR ALERTA PARA INFORMAR.
 */
+ (void)showAlertInformation:(NSString *)messageStr
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\"%@\"", NSLocalizedString(@"Alerts Receiver", nil)]
                                                    message:messageStr
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    [alert show];
    
}

#pragma mark showAlertInformation:tag:delegate:
/*!
 MOSTRAR ALERTA PARA INFORMAR.
 */
+ (void)showAlertInformation:(NSString *)messageStr
                         tag:(int)tagInt
                    delegate:(id)viewController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\"%@\"", NSLocalizedString(@"Alerts Receiver", nil)]
                                                    message:messageStr
                                                   delegate:viewController
                                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                          otherButtonTitles:nil];
    alert.tag = tagInt;
    [alert show];
    
}

#pragma mark showAlertQuestion:delegate:
/*!
 MOSTRAR ALERTA PARA PREGUNTAR.
 */
+ (void)showAlertQuestion:(NSString *)messageStr
                 delegate:(id)viewController
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"\"%@\"", NSLocalizedString(@"Alerts Receiver", nil)]
                                                    message:messageStr
                                                   delegate:viewController
                                          cancelButtonTitle:NSLocalizedString(@"Cancelar", nil)
                                          otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
    [alert show];
}

@end
