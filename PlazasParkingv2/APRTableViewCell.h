//
//  APRTableViewCell.h
//  PlazasParkingv2
//
//  Created by Albert  on 04/07/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APRTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel * lblPlaza;

@property(weak, nonatomic) IBOutlet UILabel * lblEstado;

@property(weak, nonatomic) IBOutlet UIImageView * lblImagen;

@end
