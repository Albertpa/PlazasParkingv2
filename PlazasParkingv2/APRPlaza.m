//
//  APRPlaza.m
//  PlazasParkingv2
//
//  Created by Albert  on 15/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRPlaza.h"

@implementation APRPlaza

-(id) initWithNombre: (NSString *)numplaza estado:(NSString *)estado imagen:(NSString *) imagen{
    if (self = [super init]) {
        self.numplaza = numplaza;
        self.estado = estado;
        self.imagen = imagen;
    }

    return self;

}

@end
