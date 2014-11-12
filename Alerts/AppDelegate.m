//
//  AppDelegate.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 7/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "AppDelegate.h"
#import "LoggingService.h"
#import "TrackingService.h"
#import "CoreDataManager.h"
#import "AlertsUI.h"
#import "HandleOpenURLService.h"
#import "UserSettingsService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark application:didFinishLaunchingWithOptions:
/*!
 APP SE VA A ABRIR.
 */
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // CONFIGURAR LOGGING.
    [[LoggingService sharedInstance] configure];
    
    // CONFIGURAR TRACKING.
    [[TrackingService sharedInstance] configure];
    
    // OBSERVADOR DE MODIFICACIONES EN SETTINGS.
    [[UserSettingsService sharedInstance] addObserverDidChangeNotification];
    // ACTUALZAR DATOS DE AJUSTES DE USUARIO.
    [[UserSettingsService sharedInstance] updateInstalationSettings];
    
    // COMPROBAR LA LLAMADA DE OTRA APP.
    [[HandleOpenURLService sharedInstance] checkLaunchOptionsURLKey:launchOptions];
    
    return YES;
}

#pragma mark applicationWillResignActive:
/*!
 APP SE VA A OCULTAR.
 */
- (void)applicationWillResignActive:(UIApplication *)application
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"applicationWillResignActive:"]));
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    // Saves changes in the application's managed object context before the application terminates.
    [[CoreDataManager sharedInstance] saveContext];
}

#pragma mark applicationDidEnterBackground:
/*!
 APP OCULTA.
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"applicationDidEnterBackground:"]));
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // Saves changes in the application's managed object context before the application terminates.
    [[CoreDataManager sharedInstance] saveContext];
}

#pragma mark applicationWillEnterForeground:
/*!
 APP VA A VOLVER DEL ESTADO OCULTO.
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"applicationWillEnterForeground:"]));
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

#pragma mark applicationDidBecomeActive:
/*!
 APP YA ABIERTA POR PRIMERA VEZ O DEL ESTADO OCULTA.
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"applicationDidBecomeActive:"]));
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

#pragma mark applicationWillTerminate:
/*!
 APP CERRADA.
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"applicationWillTerminate:"]));
    // ELIMINAR OBSERVADOR DE MODIFICACIONES EN SETTINGS.
    [[UserSettingsService sharedInstance] removeObserverDidChangeNotification];
    // Saves changes in the application's managed object context before the application terminates.
    [[CoreDataManager sharedInstance] saveContext];
}

#pragma mark application:handleOpenURL:
/*!
 PETICIÓN DE SERVICIO DESDE OTRA APP.
 */
- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    // PETICIÓN DE SERVICIO DESDE OTRA APP.
    [[HandleOpenURLService sharedInstance] application:application
                                         handleOpenURL:url];
    return YES;
}

#pragma BACKGROUND FETCH.

#pragma application:performFetchWithCompletionHandler:
/*!
 ACTUALIZACIONES EN BACKGROUND GESTIONADAS POR EL SISTEMA OPERATIVO.
 */
- (void)application:(UIApplication *)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:performFetchWithCompletionHandler:"]));
    
    // NOTIFICAR AL SO: UIBackgroundFetchResultNewData/UIBackgroundFetchResultFailed/UIBackgroundFetchResultNoData
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma NOTIFICACIONES PUSH.

#pragma mark application:didRegisterForRemoteNotificationsWithDeviceToken
/*!
 PERMITE DETECTAR CUANDO EL USUARIO ACEPTA O DENIEGA EL USO DE NOTIFICACIONES PUSH EN NUESTRA APP.
 */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"didRegisterForRemoteNotificationsWithDeviceToken"]));
    
}

#pragma mark application:didFailToRegisterForRemoteNotificationsWithError:
/*!
  PERMITE DETECTAR CUANDO EL USUARIO ACEPTA O DENIEGA EL USO DE NOTIFICACIONES PUSH EN NUESTRA APP.
 */
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:didFailToRegisterForRemoteNotificationsWithError"]));
    DDLogVerbose(@"El usuario no ha aceptado recibir notificaciones push de nuestra app");
    if (error.code == 3010)
    {
        DDLogVerbose(@"Push notifications are not supported in the iOS Simulator.");
    } else
        // show some alert or otherwise handle the failure to register.
    {
        DDLogVerbose(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
    }
}

#pragma mark application:didReceiveRemoteNotification:
/*!
 
 */
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:didReceiveRemoteNotification:"]));
    
}

#pragma mark application:handleActionWithIdentifier:forRemoteNotification:completionHandler:
/*!
 
 */
- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void(^)())completionHandler
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:handleActionWithIdentifier:forRemoteNotification:completionHandler:"]));
    
        completionHandler();
}

#pragma mark application:didReceiveRemoteNotification:fetchCompletionHandler:
/*!
 
 */
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"application:didReceiveRemoteNotification:fetchCompletionHandler:"]));
    
}

@end
