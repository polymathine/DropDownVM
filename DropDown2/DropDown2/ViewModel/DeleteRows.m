//
//  DeleteRows.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "DeleteRows.h"

@implementation DeleteRows

+ (void)deleteFromRow:(NSInteger)row section:(NSInteger)section inTableView:(UITableView*)tableView
{
    NSArray *deleteIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:row inSection:section], nil];
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

+ (void)insertFromRow:(NSInteger)row section:(NSInteger)section inTableView:(UITableView*)tableView
{
    NSArray *insertIndexPaths = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:row inSection:section], nil];
    
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
    
}

@end
