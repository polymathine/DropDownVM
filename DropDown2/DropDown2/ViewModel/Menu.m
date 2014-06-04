//
//  Menu.m
//  DropDown2
//
//  Created by Abby Schlageter on 04/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Menu.h"

@implementation Menu

+(NSArray*)setMenuTitles
{
    NSArray *sect0 = [[NSArray alloc] initWithObjects:@"Scan", @"Scan Now", nil];
    NSArray *sect1 = [[NSArray alloc] initWithObjects:@"Sync", @"Sync Now", nil];
    NSArray *sect2 = [[NSArray alloc] initWithObjects:@"Settings", @"Write",@"Setup", nil];
    
    NSArray *sectionsArray =[[NSArray alloc] initWithObjects:sect0, sect1, sect2, nil];

    return sectionsArray;
}

@end
