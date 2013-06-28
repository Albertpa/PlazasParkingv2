//
//  TabBarController.m
//  PlazasParkingv2
//
//  Created by Albert  on 28/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "TabBarController.h"
#import "APREstadoViewController.h"

@implementation TabBarController

- (id) init
{
    self = [super init];
    if (self)
    {
        self.delegate = self;
    }
    return self;
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController
{
    // Is this the view controller type you are interested in?
    if ([viewController isKindOfClass:[APREstadoViewController class]])
    {
       NSLog(@"ENTRA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        // call appropriate method on the class, e.g. updateView or reloadView
        [(APREstadoViewController *) viewController updateView];
    }
}

@end
