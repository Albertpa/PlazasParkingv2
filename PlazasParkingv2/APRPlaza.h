//
//  APRPlaza.h
//  PlazasParkingv2
//
//  Created by Albert  on 15/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APRPlaza : NSObject

@property (strong) NSString * numplaza;
@property (strong) NSString * estado;
@property (strong) NSString * imagen;

-(id) initWithNombre: (NSString *)numplaza estado:(NSString *)estado imagen:(NSString *) imagen;

@end
