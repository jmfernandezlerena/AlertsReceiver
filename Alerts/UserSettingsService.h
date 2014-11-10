//
//  UserSettingsService.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSettingsService : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (UserSettingsService *)sharedInstance;

#pragma mark updateInstalationSettings
/*!
 CONFIGURAR INSTALACIÓN.
 */
- (void)updateInstalationSettings;

@end
