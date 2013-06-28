//
//  APRDetalleViewController.h
//  PlazasParkingv2
//
//  Created by Albert  on 09/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRAppDelegate.h"
#import "modelo.h"

@interface APRDetalleViewController : UIViewController

@property (weak, readonly) NSManagedObjectContext * contexto;
@property NSString *plazaDetalle;

@property (weak, nonatomic) IBOutlet UISwitch *swchA;
@property (weak, nonatomic) IBOutlet UIImageView *imgFoto;

- (IBAction)cambiar:(id)sender;


@end
