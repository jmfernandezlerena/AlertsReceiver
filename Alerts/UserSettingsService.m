//
//  UserSettingsService.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 10/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "UserSettingsService.h"
#import "UserSettingsHeader.h"

@implementation UserSettingsService

/*! INSTANCIA. */
static UserSettingsService *_sharedInstance;

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
+ (UserSettingsService *)sharedInstance
{
    if ( ! _sharedInstance )
    {
        _sharedInstance = [[UserSettingsService alloc] init];
    }
    
    return _sharedInstance;
}

#pragma mark addObserverDidChangeNotification
/*!
 OBSERVADOR DE MODIFICACIONES EN SETTINGS.
 */
- (void)addObserverDidChangeNotification
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"addObserverDidChangeNotification"]));
    // DEFINIR EL OBSERVADOR DE CAMBIOS EN SETTINGS.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onDefaultsChanged:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
}

#pragma mark removeObserverDidChangeNotification
/*!
 ELIMINAR OBSERVADR DE MODIFICACIONES EN SETTINGS.
 */
- (void)removeObserverDidChangeNotification
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"removeObserverDidChangeNotification"]));
    // PARAR NSUserDefaultsDidChangeNotification
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSUserDefaultsDidChangeNotification object:nil];
}

#pragma mark updateInstalationSettings
/*!
 CONFIGURAR INSTALACIÓN.
 */
- (void)updateInstalationSettings
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"updateInstalationSettings"]));
    
    // LEER DATOS DE SETTINGS.
    [self populateRegistrationDomain];
}

#pragma MÉTODOS PRIVADOS.

#pragma mark populateRegistrationDomain
/*!
 POBLAR REGISTRO DE DOMINIOS. LOCALIZA EL ARCHIVO QUE REPRESENTA LA CONFIGURACIÓN DE LA APP Y REGISTRA LOS VALORES PREDETERMINADOS DE LA APP. 
 */
- (void)populateRegistrationDomain
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"populateRegistrationDomain"]));
    NSURL *settingsBundleURL = [[NSBundle mainBundle] URLForResource:@"Settings" withExtension:@"bundle"];
    
    // INVOCA loadDefaultsFromSettingsPage:inSettingsBundleAtURL: (FICHERO Root.plist).
    NSDictionary *appDefaults = [self loadDefaultsFromSettingsPage:@"Root.plist" inSettingsBundleAtURL:settingsBundleURL];
    
    // appDefaults is now populated with the preferences and their default values.
    // Add these to the registration domain.
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark loadDefaultsFromSettingsPage:inSettingsBundleAtURL:
/*!
 FUNCIÓN QUE ANALIZA EL FICHERO SETTINGS, EXTRAE CADA PREFERENCIA DEFINIDA. SI EL FICHERO CONTIENE 'Child Pane Element', EL MÉTODO SE EJECUTA EN LA PÁGINA DE REFERENCIA.
 */
- (NSDictionary*)loadDefaultsFromSettingsPage:(NSString*)plistName
                        inSettingsBundleAtURL:(NSURL*)settingsBundleURL
{
    // CREAR NSDICTONARY DEL FICHERO ROOT.PLIST.E
    NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfURL:[settingsBundleURL URLByAppendingPathComponent:plistName]];
    
    // LOS ELEMENTOS DEFINIDOS EN SETTINGS CONTENIDOS EN EL ARRAY ASOCIADOS A 'PreferenceSpecifiers'.
    NSArray *prefSpecifierArray = settingsDict[@"PreferenceSpecifiers"];
    
    // COMPROBAR SI EXISTE ALGÚN ERROR.
    if (prefSpecifierArray == nil)
        return nil;
    
    // CREAR UN DICCIONARIO PARA GUARDAR EL PARSEO DE LOS RESULTADOS.
    NSMutableDictionary *keyValuePairs = [NSMutableDictionary dictionary];
    
    for (NSDictionary *prefItem in prefSpecifierArray)
        // PARA CADA ELEMENTO.
    {
        // TIPO.
        NSString *prefItemType = prefItem[@"Type"];
        // CLAVE.
        NSString *prefItemKey = prefItem[@"Key"];
        // VALOR POR DEFECTO.
        NSString *prefItemDefaultValue = prefItem[@"DefaultValue"];
        
        if ([prefItemType isEqualToString:@"PSChildPaneSpecifier"])
            // PARA CADA 'Child Pane Element'.
        {
            // REALIZAR LO MISMO PARA CADA FICHERO.
            NSString *prefItemFile = prefItem[@"File"];
            
            // Recurs on the referenced page.
            NSDictionary *childPageKeyValuePairs = [self loadDefaultsFromSettingsPage:prefItemFile
                                                                inSettingsBundleAtURL:settingsBundleURL];
            
            // AAÑADIR LOS RESULTADOS.
            [keyValuePairs addEntriesFromDictionary:childPageKeyValuePairs];
        }
        else if (prefItemKey != nil && prefItemDefaultValue != nil)
            // ELEMENTOS 'Group' or 'Text Field'.
        {
            keyValuePairs[prefItemKey] = prefItemDefaultValue;
        }
    }
    
    return keyValuePairs;
}

#pragma OBSERVADOR DE NOTIFICACIONES.

#pragma mark onDefaultsChanged:
/*!
 PROCESAR NSUserDefaultsDidChangeNotification.
 */
- (void)onDefaultsChanged:(NSNotification *)aNotification
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"onDefaultsChanged:"]));
    // ACTUALIZAR DATOS.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // KEY: VERSION.
    NSString *versionStr = [defaults objectForKey:NSAppVersion];
    // KEY: RESET.
    BOOL resetAlertsStr = [defaults objectForKey:NSAppReset];
    // KEY: INSTALATION.
    BOOL InstalationStr = [defaults objectForKey:NSUserAppInstalled];
    // KEY: NAME.
    NSString *firstNameStr = [defaults objectForKey:NSUserFirstName];
    // KEY: NAME.
    NSString *lastNameStr = [defaults objectForKey:NSUserLastName];
    // KEY: SOUNDS.
    NSString *soundStr =[defaults objectForKey:NSUserSounds];
    
    // SINCRONIZAR.
    [defaults synchronize];
    
#warning ACCIONES PARA CADA AJUSTE.
}

@end
