//
//  DeleteRows.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeleteRows : NSObject
+ (void)deleteFromRow:(NSInteger)row section:(NSInteger)section inTableView:(UITableView*)tableView;

+ (void)insertFromRow:(NSInteger)row section:(NSInteger)section inTableView:(UITableView*)tableView;

@end
