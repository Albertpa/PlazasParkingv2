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
    */
    for(Plaza  *pAux in self.modelo2){
        if([pAux.estadoPlaza isEqualToString: @"Libre" ]){
            auxLi= auxLi+1;
        }else{
            auxOc= auxOc+1;
        }
    }
    
    
    
    NSString * strPlazasOc = [NSString stringWithFormat:@"%d", auxOc];
    NSString * strPlazasLi = [NSString stringWithFormat:@"%d", auxLi];
    
    self.lblPlazasOc.text = strPlazasOc;
    self.lblPlazasDis.text = strPlazasLi;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
