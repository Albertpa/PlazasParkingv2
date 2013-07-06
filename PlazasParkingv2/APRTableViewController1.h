//
//  APRTableViewController1.h
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRAppDelegate.h"
#import "modelo.h"

@interface APRTableViewController1 : UITableViewController <NSFetchedResultsControllerDelegate, UISearchBarDelegate>

@property (weak,readonly) NSManagedObjectContext * contexto;
@property (strong, nonatomic) NSFetchedResultsController *frController;
//@property (strong, nonatomic) NSFetchedResultsController *frControllerBusqueda;

@property (strong) NSMutableArray * modelo;

@property (strong, nonatomic) NSMutableArray * resultados;

@property (nonatomic, copy) NSString *savedSearchTerm;

@end
