//
//  APREstadoViewController.m
//  PlazasParkingv2
//
//  Created by Albert  on 21/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APREstadoViewController.h"
#import "APRPlaza.h"

@interface APREstadoViewController ()

@end

@implementation APREstadoViewController

-(NSManagedObjectContext *)contexto{
    APRAppDelegate * app =[[UIApplication sharedApplication] delegate];
    return app.managedObjectContext;
}

//Pequeño parche para solucionar la actulización de datos...
- (void)updateView {
    [self asignarOcupadas];
    [self asignarLibres];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)mostrarTodos{
    NSError *error;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    //Aqui, se puede ordenar
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
    resultado = [resultado sortedArrayUsingDescriptors:descriptorDeOrdenacion];
    
    NSLog(@"Las plazas ocupadas");
    //[self mostrar:resultado];
    
    return resultado;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // NSLog(@"VIEW DID LOAD===============================================================================");
	// Do any additional setup after loading the view.
    //APRPlaza * p = [self.modelo objectAtIndex:indexPath.row];
    int auxOc = 0;
    int auxLi = 0;
    
    //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    //instanciamos nuestro modelo
    self.modelo2 = [NSArray new];
    self.modelo2 = [self mostrarTodos];
    /*
    //llenamos con datos
    APRPlaza * p1 = [[APRPlaza alloc] initWithNombre:@"0A" estado:@"Libre" imagen:@"nocar.jpg"];
    APRPlaza * p2 = [[APRPlaza alloc] initWithNombre:@"0B" estado:@"Libre" imagen:@"nocar.jpg"];
    APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Ocupada" imagen:@"c1.jpeg"];
    
    [self.modelo2 addObject:p1];
    [self.modelo2 addObject:p2];
    [self.modelo2 addObject:p3];
   
    for(Plaza  *pAux in self.modelo2){
        if([pAux.estadoPlaza isEqualToString: @"Libre" ]){
            auxLi= auxLi+1;
        }else{
            auxOc= auxOc+1;
        }
    }
     */
    [self asignarOcupadas];
    [self asignarLibres];
    /*
    NSString * strPlazasOc = [NSString stringWithFormat:@"%d", [self contarOcupadas]];
    NSString * strPlazasLi = [NSString stringWithFormat:@"%d", [self contarLibres]];
    
    self.lblPlazasOc.text = strPlazasOc;
    self.lblPlazasDis.text = strPlazasLi;
     */
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self asignarOcupadas];
    [self asignarLibres];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)asignarOcupadas{
    NSError *error;
    int i=0;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    request.predicate = [NSPredicate predicateWithFormat:@"estadoPlaza='Ocupada'"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    //Aqui, se puede ordenar
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
    resultado = [resultado sortedArrayUsingDescriptors:descriptorDeOrdenacion];
    
       i = [resultado count];
    
    NSString * strPlazasOc = [NSString stringWithFormat:@"%d", i];
    self.lblPlazasOc.text = strPlazasOc;
}

-(void)asignarLibres{
    NSError *error;
    int i=0;
    
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    request.predicate = [NSPredicate predicateWithFormat:@"estadoPlaza='Libre'"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    
    //Aqui, se puede ordenar
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
    resultado = [resultado sortedArrayUsingDescriptors:descriptorDeOrdenacion];
    
    
    i = [resultado count];
    NSString * strPlazasLi = [NSString stringWithFormat:@"%d", i];
    self.lblPlazasDis.text = strPlazasLi;
}

#pragma mark - Métodos relacionados con NSFetchedResultsController


/*
//Es llamado cuando se realiza algún cambio en algún objeto:
//  -Se ha insertado un nuevo objeto
//  -Se ha eliminado un objeto
//  -Se ha actualizado un objeto
//  -Se ha movido de posición un objeto
// En esta practica no necesitamos nada mas que el insert i el delete!!!!!
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    //APRCollectionCellPlaza * plaza = self.collectionView;
    switch(type) {
        case NSFetchedResultsChangeInsert:
            //[tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            //[tableView insertItemsAtIndexPaths:@[newIndexPath]];
            [self asignarOcupadas];
            [self asignarLibres];
            break;
            
        case NSFetchedResultsChangeDelete:
            //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self asignarOcupadas];
            [self asignarLibres];

            break;
            
        case NSFetchedResultsChangeUpdate:
            //[self configurarCelda:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            //[self configurarItem: [tableView cellForRowAtIndexPath:indexPath]];
            [self asignarOcupadas];
            [self asignarLibres];

            break;
            
        case NSFetchedResultsChangeMove:
            
             //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
             //[tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
 
            [self asignarOcupadas];
            [self asignarLibres];

            break;
    }
}
*/


@end
