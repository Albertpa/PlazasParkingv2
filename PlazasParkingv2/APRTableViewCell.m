//
//  APRTableViewCell.m
//  PlazasParkingv2
//
//  Created by Albert  on 04/07/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRTableViewCell.h"

@implementation APRTableViewCell
@synthesize lblPlaza;
@synthesize lblEstado;
@synthesize lblImagen;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)reloadInputViews{
    self.textLabel.text = @"asdf";
}


@end
