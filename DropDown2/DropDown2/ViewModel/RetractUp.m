//
//  RetractUp.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "RetractUp.h"
#import "DeleteRows.h"
#import "AccessoryView.h"

@implementation RetractUp

+(BOOL)retractSection:(Sections*)theSection forCell:(UITableViewCell*)cell atIndex:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"plus_button.png"]];
    
   // theSection.down = NO; ISSUE IF THIS NEEDS TO BE HERE AND NOT JUST DONE THROUGH RETURN VALUE!!!!
    
    for (int i=([theSection.currentTitles count]-1); i>0; i--)
    {
        [theSection.currentTitles removeObjectAtIndex:i];
        [DeleteRows deleteFromRow:i section:[indexPath section] inTableView:tableView];
    }
    NSLog(@"down 2b? = %i", theSection.down);
    
    return NO;
}



@end
