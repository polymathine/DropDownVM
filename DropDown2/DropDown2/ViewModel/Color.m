//
//  Color.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Color.h"

@implementation Color
+(UIColor*)colorOne
{
    UIColor *theColorOne = [UIColor whiteColor];
    
    return theColorOne;
}

+(UIColor*)colorTwo
{
    //UIColor *theColor = [UIColor colorWithRed:0 green:0.573 blue:0.271 alpha:1]; /*hex #009245*/
    UIColor *theColor = [UIColor whiteColor];

    
    return theColor;
}

+(UIColor*)noColor
{
    UIColor *theColor = [UIColor clearColor];
    
    return theColor;
}

+(UIColor*)fontColor
{
    //UIColor *theColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    UIColor *theColor = [UIColor blackColor];
    
    return theColor;
}

+(UIColor*)navColor
{
    UIColor *theColor = [UIColor grayColor];
    
    return theColor;
}

@end
