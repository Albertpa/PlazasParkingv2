//
//  APRTableViewController1.m
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRTableViewController1.h"
#import "APRDetalleViewController.h"
#import "APRPlaza.h"

@interface APRTableViewController1 ()

@end

@implementation APRTableViewController1


-(NSManagedObjectContext *)contexto{
    APRAppDelegate * app = [[UIApplication sharedApplication] delegate];
    return app.managedObjectContext;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    //instanciamos nuestro modelo
    self.modelo = [NSMutableArray new];
    //llenamos con datos
     APRPlaza * p1 = [[APRPlaza alloc] initWithNombre:@"0A" estado:@"Libre" imagen:@"nocar.jpg"];
     APRPlaza * p2 = [[APRPlaza alloc] initWithNombre:@"0B" estado:@"Libre" imagen:@"nocar.jpg"];
     APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Ocupada" imagen:@"c1.jpeg"];
    
    [self.modelo addObject:p1];
    [self.modelo addObject:p2];
    [self.modelo addObject:p3];
    */
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    //return 1;
    return [[self.frController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

//DEPENDIENDO DE LA SECCION DEBEREMOS RETORNAR EL NUMERO DE FILAS CORRESPONDIENTE-------
    // Return the number of rows in the section.
    //return self.modelo.count;
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.frController sections][section];
    return [sectionInfo numberOfObjects];
}

- (void)configurarCelda:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Plaza *p = [self.frController objectAtIndexPath:indexPath];
    cell.textLabel.text = p.numPlaza;
    cell.detailTextLabel.text = p.estadoPlaza;
    cell.imageView.image = [UIImage imageNamed:p.fotoPlaza];
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    */
    UITableViewCell *cell;
    cell  = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Celda"];
    }
    
    // Configure the cell...
    //cell.textLabel.text = [NSString stringWithFormat:@"Celda %d", indexPath.row];
    /*
    APRPlaza * p = [self.modelo objectAtIndex:indexPath.row];
    cell.textLabel.text = p.numplaza;
    cell.detailTextLabel.text = p.estado;
    cell.imageView.image = [UIImage imageNamed:p.imagen];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    */
    [self configurarCelda:cell atIndexPath:indexPath];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    //Cuando se selecciona una celda...
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    APRDetalleViewController * controladordetalle = [storyboard instantiateViewControllerWithIdentifier:@"detalle"];
    [self.navigationController pushViewController:controladordetalle animated:YES];
    //destino.imageFile = [self.album objectAtIndex:indexPath.row];
    //controladordetalle.plazaDetalle = @"asdf";
    */

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showDetail1"]){
        
        APRDetalleViewController * destino = segue.destinationViewController;
        
        //NSIndexPath * indexPath =[[self.tableView indexPathsForSelectedRow]objectAtIndex:0];
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        
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
        
        
        //recuperar los 10 elementos proximos
        request.fetchBatchSize = 10;
        
        //ordenamos por numero de plaza
        NSArray * descriptorDeOrdenacion = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"numPlaza" ascending:YES]];
        
        //asignamos el orden de los elementos al FetchRequest
        [request setSortDescriptors:descriptorDeOrdenacion];
        
        //creamos el FetchRequestController haciendo uso del contexto y del request
        _frController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.contexto sectionNameKeyPath:nil cacheName:@"Listado"];
        
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

//Es llamado cuando se realizarán cambios en el FetchResultController
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

//Es llamado cuando se realiza algún cambio en alguna sección:
//  -Se ha insertado una nueva seccion
//  -Se ha eliminado una sección
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

//Es llamado cuando se realiza algún cambio en algún objeto:
//  -Se ha insertado un nuevo objeto
//  -Se ha eliminado un objeto
//  -Se ha actualizado un objeto
//  -Se ha movido de posición un objeto
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configurarCelda:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

//Es llamado cuando se se han terminado de realizar los cambios en el FetchResultController
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}



@end
