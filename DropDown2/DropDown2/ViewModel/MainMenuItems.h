//
//  Menu.h
//  DropDown2
//
//  Created by Abby Schlageter on 04/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menus.h"

@interface MainMenuItems : NSObject <Menus>
-(NSDictionary*)retrieveMenuTitles;
@end
