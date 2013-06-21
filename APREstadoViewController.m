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
    //APRPlaza * p = [self.modelo objectAtIndex:indexPath.row];
    int auxOc = 0;
    int auxLi = 0;
    
    //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    //instanciamos nuestro modelo
    self.modelo2 = [NSMutableArray new];
    //llenamos con datos
    APRPlaza * p1 = [[APRPlaza alloc] initWithNombre:@"0A" estado:@"Libre" imagen:@"nocar.jpg"];
    APRPlaza * p2 = [[APRPlaza alloc] initWithNombre:@"0B" estado:@"Libre" imagen:@"nocar.jpg"];
    APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Ocupada" imagen:@"nocar.jpg"];
    
    [self.modelo2 addObject:p1];
    [self.modelo2 addObject:p2];
    [self.modelo2 addObject:p3];
    for(APRPlaza  *pAux in self.modelo2){
        if([pAux.estado isEqualToString: @"Libre" ]){
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
