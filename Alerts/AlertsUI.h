//
//  AlertsUI.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 7/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertsUI : NSObject

#pragma mark showAlertError:
/*!
 MOSTRAR ALERTA DE ERROR.
 */
+ (void)showAlertError:(NSString *)messageStr;

#pragma mark showAlertInformation:
/*!
 MOSTRAR ALERTA PARA INFORMAR.
 */
+ (void)showAlertInformation:(NSString *)messageStr;

#pragma mark showAlertInformation:tag:delegate:
/*!
 MOSTRAR ALERTA PARA INFORMAR.
 */
+ (void)showAlertInformation:(NSString *)messageStr
                         tag:(int)tagInt
                    delegate:(id)viewController;

#pragma mark showAlertQuestion:delegate:
/*!
 MOSTRAR ALERTA PARA PREGUNTAR.
 */
+ (void)showAlertQuestion:(NSString *)messageStr
                 delegate:(id)viewController;

@end
