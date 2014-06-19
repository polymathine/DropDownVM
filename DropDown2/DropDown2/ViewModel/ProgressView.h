//
//  ProgressView.h
//  DropDown2
//
//  Created by Abby Schlageter on 12/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressView : NSObject
-(void)setUpProgressBarCell:(UITableViewCell*)cell;
-(instancetype)initProgressView:(UIProgressView*)progressView inView:(UIView*)view withTableView:(UITableView*)tableView withLabel:(UILabel*)label andNavController:(UINavigationController*)controller;
-(void)launchProgressView;
-(void)endProgressView;
@end
