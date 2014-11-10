//
//  LoggingService.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 26/08/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoggingService : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (LoggingService *)sharedInstance;

#pragma mark configure
/*!
 CONFIGURAR LOGGING.
 */
- (void)configure;

@end
