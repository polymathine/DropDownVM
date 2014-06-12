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
#import "Color.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainCell

+(void)configureCell:(UITableViewCell*)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"plus_button_b.png"]];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [Color fontColor];
    [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:[Fonts buttonFontSize]]];

}

+(void)configureDropCell:(UITableViewCell*)cell
{
    [[cell textLabel] setTextColor:[Color fontColor]];
    [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:40]];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.accessoryView = Nil;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    [cell.contentView.layer setBorderWidth:4.0f];
    [cell.contentView.layer setBorderColor:[UIColor yellowColor].CGColor];
}



@end
