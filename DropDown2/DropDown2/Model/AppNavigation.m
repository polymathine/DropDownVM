//
//  AppNavigation.m
//  DropDown2
//
//  Created by Abby Schlageter on 05/07/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "AppNavigation.h"
#import "MainViewController.h"
#import "MainDropDownVM.h"

@interface AppNavigation ()
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) IBOutlet MainViewController *mainViewController;
@end

@implementation AppNavigation

- (UIStoryboard *)mainStoryBoard
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

- (MainViewController *)makeMainViewController
{
    MainViewController *result = [[self mainStoryBoard] instantiateViewControllerWithIdentifier:@"mainViewController"];
    result.viewModel = [[MainDropDownVM alloc] initWithMenu:self.mainMenu];
    NSAssert(result, @"");
    return result;
}

- (void)start
{
    self.mainViewController = [self makeMainViewController];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    self.window.rootViewController = self.navController;
}

@end
