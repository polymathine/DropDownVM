//
//  Menu.m
//  DropDown2
//
//  Created by Abby Schlageter on 04/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MainMenuItems.h"
#import "Sections.h"

@interface MainMenuItems ()
@property (nonatomic, assign) int numberOfSections;
@property (nonatomic, strong) NSArray *sectionsArray;
@end

@implementation MainMenuItems

-(NSArray*)setMenuTitles
{
    NSArray *sect0 = [[NSArray alloc] initWithObjects: NSLocalizedString(@"Photo", nil), NSLocalizedString(@"Take Photo", nil), nil];
    NSArray *sect1 = [[NSArray alloc] initWithObjects: NSLocalizedString(@"Check In", nil), NSLocalizedString(@"Scan Tag", nil), nil];
    NSArray *sect2 = [[NSArray alloc] initWithObjects: NSLocalizedString(@"Check Out", nil), NSLocalizedString(@"Scan Tag", nil), nil];
    NSArray *sect3 = [[NSArray alloc] initWithObjects: NSLocalizedString(@"Trays", nil), NSLocalizedString(@"Scan Tag", nil), nil];
    NSArray *sect4 = [[NSArray alloc] initWithObjects: NSLocalizedString(@"Sync", nil), NSLocalizedString(@"Download", nil), NSLocalizedString(@"Download Clean", nil), NSLocalizedString(@"Upload", nil), nil];
    
    NSArray *sectionsArray =[[NSArray alloc] initWithObjects:sect0, sect1, sect2, sect3, sect4, nil];
    
    return sectionsArray;
}

-(NSDictionary*)retrieveMenuTitles
{
    NSMutableArray *sectionsArrays = [[NSMutableArray alloc] initWithCapacity:10];
    self.sectionsArray = [self setMenuTitles];
    self.numberOfSections = [self.sectionsArray count];
    for(int i=0; i<self.numberOfSections; i++)
    {
        Sections *sections = [[Sections alloc] initSectionWithTitles:[self.sectionsArray objectAtIndex:i]];
        [sectionsArrays addObject:sections];
    }
    NSLog(@"Section arrays all filled");
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0; i < [sectionsArrays count]; i++)
    {
        [keys addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:sectionsArrays forKeys:keys];
    
    return dictionary;

}

@end
