//
//  CellStyles.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "CellStyles.h"
#import "Color.h"
#import "Fonts.h"

@implementation CellStyles

-(void)designAttributesForMenuCell:(UITableViewCell*)cell
{
    //design
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    [cell setBackgroundColor:[Color colorTwo]];
    [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:[Fonts buttonFontSize]]];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
}

-(void)designAttributesForListCell:(UITableViewCell*)cell
{
    //design
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [Color fontColor];
    [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:[Fonts generalFontSize]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

@end
