//
//  RetractUp.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "RetractUp.h"
#import "AccessoryView.h"

@implementation RetractUp

+(BOOL)retractSection:(Sections*)theSection forCell:(UITableViewCell*)cell atIndex:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"plus_button_b.png"]];
    
    for (int i=([theSection.currentTitles count]-1); i>0; i--)
    {
        [theSection.currentTitles removeObjectAtIndex:i];
        [RetractUp deleteFromRow:i section:[indexPath section] inTableView:tableView];
    }
    NSLog(@"down 2b? = %i", theSection.down);
    
    return NO;
}

+ (void)deleteFromRow:(NSInteger)row section:(NSInteger)section inTableView:(UITableView*)tableView
{
    NSArray *deleteIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:row inSection:section], nil];
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}



@end
