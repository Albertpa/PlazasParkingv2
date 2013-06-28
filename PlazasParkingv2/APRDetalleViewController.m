//
//  APRDetalleViewController.m
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRDetalleViewController.h"

@interface APRDetalleViewController ()

@end

@implementation APRDetalleViewController

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
    self.navigationItem.title = self.plazaDetalle;
    
    NSError         * error;
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    request.predicate  = [NSPredicate predicateWithFormat:@"numPlaza=%@", self.plazaDetalle];
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    if (resultado.count>0) {
        Plaza * u = [resultado objectAtIndex:0];
        self.imgFoto.image = [UIImage imageNamed:u.fotoPlaza];
        if([u.estadoPlaza isEqualToString:@"Ocupada"]){
            self.swchA.on = YES;
        }else{
            self.swchA.on = NO;
        }
        //self.swchA.on = u.a;
        
    }
  
    //Damos de alta las notificaciones de modificaciones en el modelo
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(cambiosEnElModelo:)
     name:NSManagedObjectContextObjectsDidChangeNotification
     object:self.contexto];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cambiar:(id)sender {
    
    NSError         * error;
    NSString        * newFoto;
    NSFetchRequest * request = [[NSFetchRequest new] initWithEntityName:@"Plaza"];
    
    NSArray * fotosPlazas = [NSArray arrayWithObjects: @"c1.jpeg",@"c2.jpeg",@"c3.jpeg",@"c4.jpeg",@"c5.jpeg",@"c6.jpeg",@"c7.jpeg",@"c8.jpeg",@"c9.jpeg", nil];
    
    request.predicate  = [NSPredicate predicateWithFormat:@"numPlaza=%@", self.plazaDetalle];
    NSArray * resultado = [self.contexto executeFetchRequest:request error:&error];
    if (resultado.count>0) {
        Plaza * u = [resultado objectAtIndex:0];
        if (sender == self.swchA) {
            if(self.swchA.on == YES){
                [u setEstadoPlaza:@"Ocupada"];
                newFoto = [fotosPlazas objectAtIndex:arc4random_uniform(9)];
                [u setFotoPlaza:newFoto];
                self.imgFoto.image = [UIImage imageNamed:newFoto];
            }else{
                [u setEstadoPlaza:@"Libre"];
                [u setFotoPlaza:@"nocar.jpg"];
                /*
                 Pruebas de animaciones
                [UIView beginAnimations:@"ThisAnimation" context:nil];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                [UIView setAnimationDuration:1];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
                */
                
                [UIView commitAnimations];
                self.imgFoto.image = [UIImage imageNamed:@"nocar.jpg"];
            }
            //guardamos los datos modificados
            [self.contexto save:&error];
            //[p setA:self.swchA.on];
        }
    }
     
}

- (void)cambiosEnElModelo:(NSNotification *)notification
{
    for (id changedObj in [notification.userInfo objectForKey:NSUpdatedObjectsKey])
        NSLog(@"%@", changedObj);
}


@end
