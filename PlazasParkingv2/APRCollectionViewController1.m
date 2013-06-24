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
    
    //SE TENDRA QUE MODIFICAR CON EL CORE DATA
    //instanciamos nuestro modelo
    self.modelo3 = [NSMutableArray new];
    //llenamos con datos SOLO LOS OCUPADOS!!!
    APRPlaza * p3 = [[APRPlaza alloc] initWithNombre:@"0C" estado:@"Ocupada" imagen:@"c1.jpeg"];
    
    [self.modelo3 addObject:p3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelo3.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    APRCollectionCellPlaza * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"CellFrame" forIndexPath:indexPath];
    //falta el filtro de plazas ocupadas solo y añadir el texto
    //cell.imageFile = [self.modelo3 objectAtIndex:indexPath.row];

    APRPlaza * p = [self.modelo3 objectAtIndex:indexPath.row];
    if([p.estado isEqualToString:@"Ocupada"]){
         cell.imageFile = p.imagen;
    }
   

    
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showDetail2"]){
        APRDetalleViewController * destino = segue.destinationViewController;
        NSIndexPath * indexPath =[[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
        //destino.imageFile = [self.album objectAtIndex:indexPath.row];
    }
}



@end