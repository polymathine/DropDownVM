//
//  NavFactory.m
//  DropDown2
//
//  Created by Abby Schlageter on 19/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "NavFactory.h"
#import "NavBar.h"

@implementation NavFactory

+(void)createHomeNav:(UINavigationController*)controller
{
    controller.navigationItem.hidesBackButton = YES;
    controller.navigationBar.barStyle = UIBarStyleBlack;
    controller.navigationBar.translucent = YES; //for below iOS 7
    //Font for Bar Button Items
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NavBar navBarButtonSetup] forState:UIControlStateNormal];
    //Font for Navigation Bar Title
    [[UINavigationBar appearance] setTitleTextAttributes:[NavBar navBarTitleSetup]];

}


@end
