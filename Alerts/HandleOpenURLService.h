//
//  HandleOpenURLService.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HandleOpenURLService : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (HandleOpenURLService*)sharedInstance;

#pragma mark application:handleOpenURL:
/*!
 PETICIÓN DE SERVICIO DESDE OTRA APP.
 */
- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url;

#pragma mark checkLaunchOptionsURLKey:
/*!
 COMPROBAR LA LLAMADA DE OTRA APP.
 */
- (void)checkLaunchOptionsURLKey:(NSDictionary *)launchOptions;

@end
