//
//  Logos.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Logos.h"

@implementation Logos

+(NSString*)mainLogo
{
    NSString *logoPath =[[NSBundle mainBundle] pathForResource: @"logo_button" ofType: @"png"];
    
    return logoPath;
}

+(NSString*)whiteTextLogo
{
    NSString *logoPath =[[NSBundle mainBundle] pathForResource: @"logo_text_button" ofType: @"png"];
    
    return logoPath;
}

+(NSString*)greenTextLogo
{
    NSString *logoPath =[[NSBundle mainBundle] pathForResource: @"logo_text_green" ofType: @"png"];
    
    return logoPath;
}

@end
