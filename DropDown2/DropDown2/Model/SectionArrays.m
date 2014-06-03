//
//  SectionArrays.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "SectionArrays.h"
#import "Sections.h"


@implementation SectionArrays

//creates a dictionary with an array of Section objects and their corresponding number keys
+(NSDictionary*)addArraysForEachSection:(NSInteger)numberOfSections fromSectionRowTitles:(NSArray*)arrayOfSectionArrays toArray:(NSMutableArray*)sectionsArray
{
    for(int i=0; i<numberOfSections; i++)
    {
        Sections *sections = [[Sections alloc] initSectionWithTitles:[arrayOfSectionArrays objectAtIndex:i]];
        [sectionsArray addObject:sections];
    }
    NSLog(@"Section arrays all filled");
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0; i < [sectionsArray count]; i++)
    {
        [keys addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:sectionsArray forKeys:keys];
    
    return dictionary;
}

@end
