//
//  APREstadoViewController.h
//  PlazasParkingv2
//
//  Created by Albert  on 21/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRAppDelegate.h"
#import "modelo.h"

@interface APREstadoViewController : UIViewController

@property (weak, readonly) NSManagedObjectContext * contexto;

@property (weak, nonatomic) IBOutlet UILabel *lblPlazasOc;

@property (weak, nonatomic) IBOutlet UILabel *lblPlazasDis;

@property (strong) NSArray * modelo2;


@end
