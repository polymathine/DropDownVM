//
//  MainCell.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MainCell.h"
#import "AccessoryView.h"
#import "FontFactory.h"
#import "Color.h"
#import <QuartzCore/QuartzCore.h>
#import "ExpandDown.h"
#import "RetractUp.h"

@interface MainCell ()
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) Sections *section;
@end

@implementation MainCell
-(instancetype)initMainCellThatHasIndexPath:(NSIndexPath*)indexPath inTableView:(UITableView*)tableView forSection:(Sections*)section
{
    if(self = [super init])
    {
        _indexPath = indexPath;
        _tableView = tableView;
        _section = section;
    }
    return self;
}

-(void)configureMainCell:(UITableViewCell*)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryView = [AccessoryView customAccessoryViewFor:[UIImage imageNamed:@"plus_button_b.png"]];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = [Color fontColor];
    [cell.textLabel setFont:[UIFont fontWithName:[FontFactory fontLight] size:[FontFactory buttonFontSize]]];

}

-(BOOL)expandCellsFrom:(UITableViewCell*)cell
{
    return [ExpandDown expandSection:self.section forCell:cell atIndex:self.indexPath inTableView:self.tableView];
}

-(BOOL)retractCellsUpTo:(UITableViewCell*)cell
{
    return [RetractUp retractSection:self.section forCell:cell atIndex:self.indexPath inTableView:self.tableView];
}





@end
