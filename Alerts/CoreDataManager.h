//
//  CoreDataManager.h
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 25/09/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

/*! 
 CONTEXTO EN EL CUAL SE VAN A REALIZAR TODAS LAS OPERACIONES DE ESCRITURA Y LECTURA EN EL MODELO.
 NOS DA ACCESO A LA GENERACIÓN DE NUEVAS INSTANCIAS DE LAS ENTIDADES DEL MODELO O REALIZAR CONSULTAS. 
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/*! MODELO DE LA BASE DE DATOS. */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/*! ENCARGADO DE REALIZAR LA PERSISTENCIA REAL EN DISCO; POR DEFECTO SQLITE. */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark sharedInstance
/*!
 INSTANCIA DE CORE DATA.
 */
+ (CoreDataManager *)sharedInstance;

#pragma mark saveContext
/*!
 RECOGER LA LÓGICA DE GUARDADO DEL CONTEXTO.
 */
- (void)saveContext;

#pragma mark applicationDocumentsDirectory
/*!
 RECUPERAR EL DIRECTORIO "Documents".
 */
- (NSURL *)applicationDocumentsDirectory;

@end
