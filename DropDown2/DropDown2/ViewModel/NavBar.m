//
//  NavBar.m
//  DropDown2
//
//  Created by Abby Schlageter on 04/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "NavBar.h"
#import "FontFactory.h"
#import "Color.h"

@implementation NavBar

+(NSMutableDictionary*)navBarTitleSetup
{
    NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleAttributes setValue:[UIFont fontWithName:[FontFactory fontLight] size:[FontFactory generalFontSize]] forKey:NSFontAttributeName];

    return titleAttributes;
}


+(NSMutableDictionary*)navBarButtonSetup
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [attributes setValue:[UIFont fontWithName:[FontFactory fontBold] size:[FontFactory smallFontSize]] forKey:NSFontAttributeName];
    [attributes setValue:[Color fontColor] forKey:NSForegroundColorAttributeName];
    
    return attributes;

}


@end
