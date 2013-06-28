//
//  APRCollectionViewController1.m
//  PlazasParkingv2
//
//  Created by Albert  on 23/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRCollectionViewController1.h"
#import "APRPlaza.h"
#import "APRCollectionCellPlaza.h"
#import "APRDetalleViewController.h"

@interface APRCollectionViewController1 ()

@end

@implementation APRCollectionViewController1

-(NSManagedObjectContext *)contexto{
    APRAppDelegate * app =[[UIApplication sharedApplication] delegate];
    return app.managedObjectContext;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
   
    //instanciamos nuestro modelo
    self.modelo3 = [NSArray new];
    
    //llenamos con datos SOLO LOS OCUPADOS!!!
    self.modelo3 = [self mostrarOcupadas];
    /*
      //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Ocupada" imagen:@"c1.jpeg"];
    APRPlaza * p4 = [[APRPlaza alloc] initWithNombre:@"1C" estado:@"Ocupada" imagen:@"c2.jpeg"];
    APRPlaza * p5 = [[APRPlaza alloc] initWithNombre:@"2C" estado:@"Ocupada" imagen:@"c3.jpeg"];
    APRPlaza * p6 = [[APRPlaza alloc] initWithNombre:@"3C" estado:@"Ocupada" imagen:@"c4.jpeg"];
    APRPlaza * p7 = [[APRPlaza alloc] initWithNombre:@"0A" estado:@"Ocupada" imagen:@"c1.jpeg"];
    APRPlaza * p8 = [[APRPlaza alloc] initWithNombre:@"1A" estado:@"Ocupada" imagen:@"c2.jpeg"];
    APRPlaza * p9 = [[APRPlaza alloc] initWithNombre:@"2A" estado:@"Ocupada" imagen:@"c3.jpeg"];
    APRPlaza * p10 = [[APRPlaza alloc] initWithNombre:@"3A" estado:@"Ocupada" imagen:@"c4.jpeg"];
    APRPlaza * p11 = [[APRPlaza alloc] initWithNombre:@"0B" estado:@"Ocupada" imagen:@"c1.jpeg"];
    APRPlaza * p12 = [[APRPlaza alloc] initWithNombre:@"1B" estado:@"Ocupada" imagen:@"c2.jpeg"];
    APRPlaza * p13 = [[APRPlaza alloc] initWithNombre:@"2B" estado:@"Ocupada" imagen:@"c3.jpeg"];
    APRPlaza * p14 = [[APRPlaza alloc] initWithNombre:@"3B" estado:@"Ocupada" imagen:@"c4.jpeg"];
    
    [self.modelo3 addObject:p3];
    [self.modelo3 addObject:p4];
    [self.modelo3 addObject:p5];
    [self.modelo3 addObject:p6];
    [self.modelo3 addObject:p7];
    [self.modelo3 addObject:p8];
    [self.modelo3 addObject:p9];
    [self.modelo3 addObject:p10];
    [self.modelo3 addObject:p11];
    [self.modelo3 addObject:p12];
    [self.modelo3 addObject:p13];
    [self.modelo3 addObject:p14];
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mostrar:(NSArray *)plazasOcupadas{
    Plaza * p;
    NSLog(@"==RES==");
    NSLog(@"Plaza\t\tEstado\t\tFoto");
    for(int i = 0; i< plazasOcupadas.count; i++){
        p = [plazasOcupadas objectAtIndex:i];
        NSLog(@"%@\t\t%@\t\t%@", p.numPlaza, p.estadoPlaza, p.fotoPlaza);
        
    }
}
-(NSArray *)mostrarOcupadas{
    NSError *error;
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    request.predicate = [NSPredicate predicateWithFormat:@"estadoPlaza='Ocupada'"];
    
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];

    //Aqui, se puede ordenar
    NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
    resultado = [resultado sortedArrayUsingDescriptors:descriptorDeOrdenacion];
    
    NSLog(@"Las plazas ocupadas");
    [self mostrar:resultado];
    
    return resultado;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //return 1;
    return [[self.frController sections] count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //return self.modelo3.count;
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.frController sections][section];
    return [sectionInfo numberOfObjects];
}


- (void)configurarItem:(APRCollectionCellPlaza *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Plaza *p = [self.frController objectAtIndexPath:indexPath];
    cell.NumPlazas = p.numPlaza;
    cell.imageFile = p.fotoPlaza;
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell reloadInputViews];
}

  

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    APRCollectionCellPlaza * cell;
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellFrame" forIndexPath:indexPath];
    
    /*
    if(cell == nil){
    
    }*/
    //falta el filtro de plazas ocupadas solo y añadir el texto
    //cell.imageFile = [self.modelo3 objectAtIndex:indexPath.row];
    /*
    APRPlaza * p = [self.modelo3 objectAtIndex:indexPath.row];
    if([p.estado isEqualToString:@"Ocupada"]){
         cell.imageFile = p.imagen;
         cell.NumPlazas = p.numplaza;
    }*/

        //Plaza * p = [self.modelo3 objectAtIndex:indexPath.row];
    
    
    /*
        Plaza *p = [self.frController objectAtIndexPath:indexPath];
        cell.NumPlazas = p.numPlaza;
        cell.imageFile = p.fotoPlaza;
    
        NSLog(@"Rows->%d",indexPath.row);
    
        NSLog(@"Valores->%@",p.numPlaza);
    */
        [self configurarItem:cell atIndexPath:indexPath];
        
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showDetail2"]){
        APRDetalleViewController * destino = segue.destinationViewController;
        NSIndexPath * indexPath =[[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
        
        //destino.imageFile = [self.album objectAtIndex:indexPath.row];
        Plaza *p = [self.frController objectAtIndexPath:indexPath];
        //NSLog(@"entra y es%@", p.numPlaza);
        destino.plazaDetalle = p.numPlaza;
    }
}

#pragma mark - Métodos relacionados con NSFetchedResultsController

- (NSFetchedResultsController *)frController
{
    if (_frController == nil) {
        
        NSFetchRequest *request = [NSFetchRequest new];
        
        NSEntityDescription *entidad = [NSEntityDescription entityForName:@"Plaza" inManagedObjectContext:self.contexto];
        
        request.entity = entidad;
        request.predicate = [NSPredicate predicateWithFormat:@"estadoPlaza='Ocupada'"];
        
        //recuperar los 10 elementos proximos
        request.fetchBatchSize = 10;
        
        //ordenamos por numero de plaza
        NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
        
        //asignamos el orden de los elementos al FetchRequest
        [request setSortDescriptors:descriptorDeOrdenacion];
        
        //creamos el FetchRequestController haciendo uso del contexto y del request
        _frController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.contexto sectionNameKeyPath:nil cacheName:nil];
        /*
                 _frController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.contexto sectionNameKeyPath:nil cacheName:@"Listado3"];*/
        
        //asignamos el delegado
        _frController.delegate = self;
        
        
        NSError *error = nil;
        if (![self.frController performFetch:&error]) {
            NSLog(@"Upps!! parece que hay un error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    return _frController;
}



/*
//Es llamado cuando se realizarán cambios en el FetchResultController
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
    
}
 */


//Es llamado cuando se realiza algún cambio en alguna sección:
//  -Se ha insertado una nueva seccion
//  -Se ha eliminado una sección
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.collectionView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.collectionView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
            break;
    }
}




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
    //UITableView *tableView = self.tableView;
    UICollectionView *tableView = self.collectionView;
    //APRCollectionCellPlaza * plaza = self.collectionView;
    switch(type) {
        case NSFetchedResultsChangeInsert:
            //[tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
             [tableView insertItemsAtIndexPaths:@[newIndexPath]];
            break;
            
        case NSFetchedResultsChangeDelete:
            //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView deleteItemsAtIndexPaths:@[indexPath]];
            break;
            
        case NSFetchedResultsChangeUpdate:
            //[self configurarCelda:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            //[self configurarItem: [tableView cellForRowAtIndexPath:indexPath]];
            break;
            
        case NSFetchedResultsChangeMove:
            /*
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            */
            [tableView deleteItemsAtIndexPaths:@[indexPath]];
            [tableView insertItemsAtIndexPaths:@[newIndexPath]];
            break;
    }
}

/*
//Es llamado cuando se se han terminado de realizar los cambios en el FetchResultController
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}
 */


@end
