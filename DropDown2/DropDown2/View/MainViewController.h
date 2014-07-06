//
//  ViewController.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownViewModel.h"

@interface MainViewController : UITableViewController

@property (nonatomic, strong) id<DropDownViewModel> viewModel;

@end
