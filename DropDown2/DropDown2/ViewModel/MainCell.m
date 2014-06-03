//
//  MainCell.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MainCell.h"
#import "AccessoryView.h"
#import "Fonts.h"

@implementation MainCell

+(void)configureCell:(UITableViewCell*)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"plus_button.png"]];
    
    //design
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:[Fonts buttonFontSize]]];
}

@end
