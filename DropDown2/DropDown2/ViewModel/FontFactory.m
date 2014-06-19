//
//  FontFactory.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "FontFactory.h"

@implementation FontFactory
+(NSString*)fontLight
{
    NSString *font = @"Lato-Light";
    
    return font;
}

+(NSString*)fontBold
{
    NSString *font = @"Lato-Black";
    
    return font;
}

+(NSString*)fontReg
{
    NSString *font = @"Lato Regular";
    
    return font;
}

+(CGFloat)smallFontSize
{
    CGFloat fontSize = 16.0;
    
    return fontSize;
}

+(CGFloat)generalFontSize
{
    CGFloat fontSize = 22.0;
    
    return fontSize;
}


+(CGFloat)buttonFontSize
{
    CGFloat fontSize = 40.0;
    
    return fontSize;
}

+(CGFloat)pickerFontSize
{
    CGFloat fontSize = 35.0;
    
    return fontSize;
}




@end
