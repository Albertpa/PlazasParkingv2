//
//  APRAppDelegate.m
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRAppDelegate.h"

@implementation APRAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;




-(BOOL)firstExec{
    
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //Creamos la ruta del fichero de configuración
    NSString *plist = [[[self applicationDocumentsDirectory] path] stringByAppendingPathComponent:@"config.plist"];
    
    NSFileManager *fileManager = [NSFileManager new];
    
    //Preguntamos si el fichero esiste o no
    if (![fileManager fileExistsAtPath: plist])
    {
        //Creamos un diccionario para guardar las opciones de configuración
        NSMutableDictionary *config = [NSMutableDictionary new];
        
        //Asignamos la configuración inicial
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"primeraEjecucion"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config1"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config2"];
        [config setValue:[NSNumber numberWithBool:NO] forKey:@"config3"];
        
        //Guardamos el diccionario en el archivo config.plist
        NSLog(@"Configuración: %@", config);
        [config writeToFile:plist atomically: YES];
        
        //Llamamos a los métodos de iniciación
        [self llenarModelo];
        
        //Es la primera ejecución del programa
        return YES;
    }
    
    //Imprimimos la configuración
    NSMutableDictionary *config = [NSMutableDictionary dictionaryWithContentsOfFile:plist];
    NSLog(@"Configuración: %@", config);
    
    //No es la primera ejecución del programa
    return NO;
}



-(void)llenarModelo{
    
    int         x;
    int         y;
    Plaza     * plazaNueva;
    
    NSLog(@"Llenamos el modelo.");
    
    
    NSArray * fotosPlazas = [NSArray arrayWithObjects: @"c1.jpeg",@"c2.jpeg",@"c3.jpeg",@"c4.jpeg",@"c5.jpeg",@"c6.jpeg",@"c7.jpeg",@"c8.jpeg",@"c9.jpeg", nil];
    
    
    
    NSArray * estadoPlaza = [NSArray arrayWithObjects: @"Ocupada",@"Libre", nil];
    
    
    
    NSArray * letras = [NSArray arrayWithObjects: @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
        
    //Añadimos las plazas
    for(y = 0; y< 10; y++){
        for (x = 0; x< letras.count; x++) {
            plazaNueva = [NSEntityDescription insertNewObjectForEntityForName:@"Plaza" inManagedObjectContext:self.managedObjectContext];
            NSString * nomAux = [NSString stringWithFormat:@"%d%@", y, [letras objectAtIndex:x]];
            plazaNueva.numPlaza =nomAux;
            
            NSString * estatAux = [estadoPlaza objectAtIndex:arc4random_uniform(2)];
            plazaNueva.estadoPlaza =estatAux;
            
            if([estatAux isEqualToString:@"Ocupada"]){
                    plazaNueva.fotoPlaza =  [fotosPlazas objectAtIndex:arc4random_uniform(9)];
            }else{
                    plazaNueva.fotoPlaza = @"nocar.jpg";
            }
            
            /*
            usuario.nombre = [mujeres objectAtIndex:x];
            usuario.sexo = @"Mujer";
            usuario.edad =  18 + arc4random_uniform(30);
            usuario.a = arc4random_uniform(2);
            usuario.b = arc4random_uniform(2);
            usuario.estadoCivil = [estadoCivil objectAtIndex:arc4random_uniform(3)];
            usuario.foto = [albumMujeres objectAtIndex:x];
             */
        }
    }

    [self saveContext];
    
}


-(void) crearDatos{
    
    //primera manera de crear
    /*
    NSEntityDescription * nuevaPlaza = [NSEntityDescription insertNewObjectForEntityForName:@"Plaza" inManagedObjectContext:self.managedObjectContext];
        //en esta, para asignar una de sus propiedades se hace:
        [nuevaPlaza setValue:@"c1" forKey:@"numPlaza"];
    */
    
    
    //otra manera de crear, mediante las clases generadas anteriormente y la asignación de valores es mas sencilla
    
    Plaza * nuevaPlaza = [NSEntityDescription insertNewObjectForEntityForName:@"Plaza" inManagedObjectContext:self.managedObjectContext];
    
    nuevaPlaza.numPlaza = @"0C";
    nuevaPlaza.estadoPlaza = @"Ocupada";
    nuevaPlaza.fotoPlaza = @"c1.jpeg";
    
    
    Plaza * nuevaPlaza1 = [NSEntityDescription insertNewObjectForEntityForName:@"Plaza" inManagedObjectContext:self.managedObjectContext];
    
    nuevaPlaza1.numPlaza = @"1C";
    nuevaPlaza1.estadoPlaza = @"Libre";
    nuevaPlaza1.fotoPlaza = @"nocar.jpg";
    
    Plaza * nuevaPlaza2 = [NSEntityDescription insertNewObjectForEntityForName:@"Plaza" inManagedObjectContext:self.managedObjectContext];
    
    nuevaPlaza2.numPlaza = @"2C";
    nuevaPlaza2.estadoPlaza = @"Ocupada";
    nuevaPlaza2.fotoPlaza = @"c2.jpeg";
        
}



-(void) mostrarDatos{
    
    NSFetchRequest * busquedaPlazas = [ [NSFetchRequest alloc] initWithEntityName:@"Plaza"];
    
    //Aqui, se puede ordenar
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
    
    //Recorremos
    NSArray * plazasActuales = [self.managedObjectContext executeFetchRequest:busquedaPlazas error:nil];
    plazasActuales = [plazasActuales sortedArrayUsingDescriptors:descriptorDeOrdenacion];
    
    for (Plaza * p in plazasActuales) {
        NSLog(@"======= %@ === %@ === %@ ==========", p.numPlaza, p.estadoPlaza, p.fotoPlaza);
               
    }
    //mostramos por consola
    
    
}

-(NSInteger) hayDatos{
    
    NSInteger myInt;
    myInt = 0;
    
    NSFetchRequest * busquedaPlazas = [ [NSFetchRequest alloc] initWithEntityName:@"Plaza"];
    
    //Recorremos
    NSArray * plazasActuales = [self.managedObjectContext executeFetchRequest:busquedaPlazas error:nil];
    myInt = [plazasActuales count];
    return  myInt;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //tiene que crear datos SOLO LA PRIMERA VEZ
    //De la siguiente manera se miraba si la base de datos contenia algun registro
    /*
    NSInteger auxInt = [self hayDatos];
    //NSLog(@"======= %ld ===", (long)auxInt);
    if(auxInt <= 0){
        [self crearDatos];
    }
    */
    
    //de la siguiente manera se ejecuta solo la primera vez como se ha enseñado en el curso,
    [self firstExec];
    
    //salva dentro del fichero de datos con saveContext, para que se guarden una vez generados
    [self saveContext];
    [self mostrarDatos];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     [self saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     [self saveContext];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
     [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    
    NSLog(@"%@", [self managedObjectModel]);
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

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Plaza" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Plaza.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
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
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}




#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
