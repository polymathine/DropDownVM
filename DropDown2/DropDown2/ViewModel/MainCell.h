//
//  MainCell.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sections.h"


@interface MainCell : NSObject

-(instancetype)initMainCellThatHasIndexPath:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView forSection:(Sections*)section;
-(void)configureMainCell:(UITableViewCell*)cell;
-(BOOL)expandCellsFrom:(UITableViewCell*)cell;
-(BOOL)retractCellsUpTo:(UITableViewCell*)cell;

@end
