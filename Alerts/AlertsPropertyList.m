//
//  AlertsPropertyList.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "AlertsPropertyList.h"

@implementation AlertsPropertyList

/*! INSTANCIA. */
static AlertsPropertyList *_sharedInstance;

/* PATH PLIST. */
NSString *_path;

/* DATOS PLIST.*/
NSData *_plistXML;

#pragma CICLO DE VIDA.

#pragma mark init
/*!
 CONSTRUCTOR.
 */
- (id)init
{
    self = [super init];
    if (self) {
        _sharedInstance = self;
    }
    return self;
}

#pragma MÉTODOS PÚBLICOS.

#pragma mark sharedInstance
/*!
 INSTANCIA
 */
+ (AlertsPropertyList *)sharedInstance
{
    if ( ! _sharedInstance ) {
        _sharedInstance = [[AlertsPropertyList alloc] init];
        
        _path = [[NSBundle mainBundle] pathForResource:@"Alerts Property List"
                                                ofType:@"plist"];
        _plistXML = [[NSFileManager defaultManager] contentsAtPath:_path];
    }
    return _sharedInstance;
}

#pragma mark objectForKey:
/*!
 OBTENER VALOR PARA KEY.
 */
- (NSObject *)objectForKey:(NSString *)key
{
    NSError *error = nil;
    NSPropertyListFormat format;
    NSDictionary *temp = (NSDictionary *) [NSPropertyListSerialization propertyListWithData:_plistXML
                                                                                    options:NSPropertyListMutableContainersAndLeaves
                                                                                     format:&format
                                                                                      error:&error];
    if (error) {
        DDLogVerbose(@"Error: %@", error);
        NSDictionary *userInfoMsg = [[ErrorService sharedInstance] valueMsgForUserInfo:[error userInfo]];
        NSException* exception = [NSException exceptionWithName:NSExceptionAppDomain
                                                         reason:[userInfoMsg description]
                                                       userInfo:userInfoMsg];
        @throw exception;
    }
    
    return[temp objectForKey:key];
}

@end
