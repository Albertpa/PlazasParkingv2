//
//  APRCollectionCellPlaza.m
//  PlazasParkingv2
//
//  Created by Albert  on 23/06/13.
//  Copyright (c) 2013 Albert Pages. All rights reserved.
//

#import "APRCollectionCellPlaza.h"

@implementation APRCollectionCellPlaza

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)reloadInputViews{
    self.imgPhoto.image =[UIImage imageNamed:self.imageFile];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self reloadInputViews];
}


@end
