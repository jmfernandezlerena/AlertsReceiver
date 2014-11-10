//
//  AlertsPropertyList.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertsPropertyList : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (AlertsPropertyList *)sharedInstance;

#pragma mark objectForKey:
/*!
 OBTENER VALOR PARA KEY.
 */
- (NSObject *)objectForKey:(NSString *)key;

@end
