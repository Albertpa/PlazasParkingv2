//
//  Plaza.h
//  PlazasParkingv2
//
//  Created by Albert  on 24/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Plaza : NSManagedObject

@property (nonatomic, retain) NSString * estadoPlaza;
@property (nonatomic, retain) NSString * fotoPlaza;
@property (nonatomic, retain) NSString * numPlaza;

@end
