//
//  TrackingService.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackingHeader.h"

@interface TrackingService : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (TrackingService *)sharedInstance;

#pragma mark configure
/*!
 CONFIGURAR LOGGING.
 */
- (void)configure;

#pragma mark trackingToViewController:
/*!
 TRACKING A VIEW CONTROLLER.
 */
- (void)trackingToViewController:(NSString *)nameViewController;

#pragma mark tranckingToEventWithCategory:action:label:
/*!
 TRACKING A EVENTO.
 */
- (void)trackingToEventWithCategory:(NSString *)categoryEvent
                             action:(NSString *)action
                              label:(NSString *)label;

#pragma mark tranckingToExceptionWithDescription:number:
/*!
 TRACKING A EXCEPTION.
 */
- (void)tranckingToExceptionWithDescription:(NSString *)descriptionException
                                     number:(NSNumber *)numberException;

@end

