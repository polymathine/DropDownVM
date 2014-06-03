//
//  AccessoryView.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "AccessoryView.h"

@implementation AccessoryView

+(UIView*)customAccessoryViewFor:(UIImage*)theAccessory
{
    UIImageView *accImageView = [[UIImageView alloc] initWithImage:theAccessory];
    accImageView.userInteractionEnabled = YES;
    [accImageView setFrame:CGRectMake(0, 0, 28.0, 28.0)];
    
    return accImageView;
}

@end
