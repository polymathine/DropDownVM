//
//  ExpandDown.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ExpandDown.h"
#import "DeleteRows.h"
#import "AccessoryView.h"

@implementation ExpandDown


+(BOOL)expandSection:(Sections*)theSection forCell:(UITableViewCell*)cell atIndex:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView
{
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"minus_button.png"]];
    
    for (int i=1; i<[theSection.titles count]; i++) {
        [theSection.currentTitles insertObject:[theSection.titles objectAtIndex:i] atIndex:i];
        [DeleteRows insertFromRow:i section:[indexPath section] inTableView:tableView];
    }
    return YES;
}


@end
