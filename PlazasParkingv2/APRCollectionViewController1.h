//
//  APRCollectionViewController1.h
//  PlazasParkingv2
//
//  Created by Albert  on 23/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRAppDelegate.h"
#import "modelo.h"

@interface APRCollectionViewController1 : UICollectionViewController <NSFetchedResultsControllerDelegate>

@property (weak, readonly) NSManagedObjectContext * contexto;
@property (strong, nonatomic) NSFetchedResultsController *frController;

@property (strong) NSArray * modelo3;

-(void)mostrar:(NSArray *)plazasOcupadas;

@end
