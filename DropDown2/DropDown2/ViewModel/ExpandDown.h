//
//  ExpandDown.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sections.h"

@interface ExpandDown : NSObject
+(BOOL)expandSection:(Sections*)theSection forCell:(UITableViewCell*)cell atIndex:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView;

@end
