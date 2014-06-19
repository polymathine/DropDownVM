//
//  DropCell.m
//  DropDown2
//
//  Created by Abby Schlageter on 12/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "DropCell.h"
#import "Color.h"
#import "FontFactory.h"

@implementation DropCell

-(void)configureDropCell:(UITableViewCell*)cell
{
    [[cell textLabel] setTextColor:[Color fontColor]];
    [cell.textLabel setFont:[UIFont fontWithName:[FontFactory fontLight] size:[FontFactory buttonFontSize]]];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.accessoryView = Nil;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    [cell.contentView.layer setBorderWidth:4.0f];
    [cell.contentView.layer setBorderColor:[UIColor yellowColor].CGColor];
}

@end
