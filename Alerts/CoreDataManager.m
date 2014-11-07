//
//  CoreDataManager.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 25/09/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

/*! INSTANCIA DE LA CLASE. */
static CoreDataManager* _sharedInstance;

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

#pragma METODOS PRIVADOS.

#pragma mark managedObjectContext
/*!
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark managedObjectModel
/*!
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Alerts"
                                              withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

#pragma mark persistentStoreCoordinator
/*!
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Definimos como Store para Core Data el archivo con nombre igual al que tiene
    // datos por defecto (pero que no existirá en la primera ejecución)
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Alerts.sqlite"];
    
    // Creamos un File Manager y verificamos si existe el archivo anterior en dicha URL
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // En caso contrario, lo copiamos desde nuestro Sandbox
    if (![fileManager fileExistsAtPath:storeURL.path]) {
        
        NSURL *sandboxStoreURL = [[NSBundle mainBundle] URLForResource:@"Alerts"
                                                         withExtension:@"sqlite"];
        if (sandboxStoreURL) {
            [fileManager copyItemAtURL:sandboxStoreURL
                                 toURL:storeURL
                                 error:NULL];
        }
    }
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:nil
                                                           error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [error userInfo]]));
    }
    
    return _persistentStoreCoordinator;
}

#pragma METODOS PUBLICOS.

#pragma mark sharedInstance
/*!
 OBTENER LA INSTANCIA.
 */
+ (CoreDataManager*)sharedInstance
{
    if ( ! _sharedInstance )
        _sharedInstance = [[CoreDataManager alloc] init];
    
    return _sharedInstance;
}

#pragma mark saveContext
/*!
 RECOGER LA LÓGICA DE GUARDADO DEL CONTEXTO.
 */
- (void)saveContext
{
    DDLogVerbose(([NSString stringWithFormat:@"%@...%@", NSStringFromClass([self class]), @"saveContext"]));
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges]
            && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            DDLogError(([NSString stringWithFormat:@"[ERROR] %@...%@", NSStringFromClass([self class]), [error userInfo]]));
        }
    }
}

#pragma mark applicationDocumentsDirectory
/*!
 RECUPERAR EL DIRECTORIO "Documents".
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

@end