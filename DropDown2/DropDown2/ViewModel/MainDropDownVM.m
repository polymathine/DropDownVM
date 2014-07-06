//
//  MainDropDownVM.m
//  DropDown2
//
//  Created by Abby Schlageter on 05/07/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MainDropDownVM.h"

@interface MainDropDownVM ()
@property (nonatomic, strong) MainMenuItems *menu;

@end

@implementation MainDropDownVM

@synthesize dictionary;

-(instancetype)initWithMenu:(id<Menus>)menu
{
    if (self = [super init])
    {
        _menu = menu;
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.dictionary = [self.menu retrieveMenuTitles];
}



@end
