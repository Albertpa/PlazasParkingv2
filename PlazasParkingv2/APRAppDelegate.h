//
//  APRAppDelegate.h
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "modelo.h"
@interface APRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(void) crearDatos;
-(void) mostrarDatos;
-(NSInteger) hayDatos;

@end
