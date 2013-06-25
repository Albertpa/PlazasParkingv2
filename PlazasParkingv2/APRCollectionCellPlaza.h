//
//  APRCollectionCellPlaza.h
//  PlazasParkingv2
//
//  Created by Albert  on 23/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APRCollectionCellPlaza : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UILabel * lblNumPlazas;

@property NSString *imageFile;

@property NSString *NumPlazas;

@end
