//
//  AppNavigation.h
//  DropDown2
//
//  Created by Abby Schlageter on 05/07/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menus.h"

@interface AppNavigation : NSObject

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) id<Menus> mainMenu;

- (void)start;

@end
