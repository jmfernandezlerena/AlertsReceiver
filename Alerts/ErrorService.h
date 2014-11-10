//
//  ErrorService.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorService : NSObject

#pragma mark sharedInstance
/*!
 INSTANCIA.
 */
+ (ErrorService *)sharedInstance;

#pragma mark valueMsgForUserInfo:
/*!
 MENSAJE DE ERROR.
 */
- (NSDictionary *)valueMsgForUserInfo:(NSDictionary *)userInfo;

@end
