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

    //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    //instanciamos nuestro modelo
    self.modelo = [NSMutableArray new];
    //llenamos con datos
     APRPlaza * p1 = [[APRPlaza alloc] initWithNombre:@"0A" estado:@"Libre" imagen:@"nocar.jpg"];
     APRPlaza * p2 = [[APRPlaza alloc] initWithNombre:@"0B" estado:@"Libre" imagen:@"nocar.jpg"];
     APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Libre" imagen:@"nocar.jpg"];
    
    [self.modelo addObject:p1];
    [self.modelo addObject:p2];
    [self.modelo addObject:p3];
    
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
//LAS SECCIONES PUEDEN VARIAR----------------
    
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

//DEPENDIENDO DE LA SECCION DEBEREMOS RETORNAR EL NUMERO DE FILAS CORRESPONDIENTE-------
    // Return the number of rows in the section.
    return self.modelo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    */
    UITableViewCell *cell;
    cell  = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    //cell.textLabel.text = [NSString stringWithFormat:@"Celda %d", indexPath.row];
    
    APRPlaza * p = [self.modelo objectAtIndex:indexPath.row];
    
    cell.textLabel.text = p.numplaza;
    cell.detailTextLabel.text = p.estado;
    cell.imageView.image = [UIImage imageNamed:p.imagen];
   /*
    cell.accessoryView = ;
    */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

    //Cuando se selecciona una celda...
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    APRDetalleViewController * controladordetalle = [storyboard instantiateViewControllerWithIdentifier:@"detalle"];
    [self.navigationController pushViewController:controladordetalle animated:YES];
}

@end
