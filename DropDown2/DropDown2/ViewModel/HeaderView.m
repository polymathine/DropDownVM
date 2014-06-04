//
//  HeaderView.m
//  DropDown2
//
//  Created by Abby Schlageter on 04/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "HeaderView.h"
#import "Logos.h"

@implementation HeaderView
+(UIButton*)headerButtonForView:(UITableView*)tableView
{
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, 160.0)];
    tableView.tableHeaderView = headerView;
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame= CGRectMake(0.0, 20.0, 320.0, 120.0);
    
    [but setImage:[UIImage imageWithContentsOfFile:[Logos mainLogo]] forState:UIControlStateNormal];
    return but;
}


@end
