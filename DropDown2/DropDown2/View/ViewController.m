//
//  ViewController.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ViewController.h"
#import "RetractUp.h"
#import "ExpandDown.h"
#import "ProgressViewCell.h"
#import "SectionArrays.h"
#import "Color.h"
#import "TableHeights.h"
#import "MainCell.h"
#import "Menu.h"
#import "NavBar.h"
#import "HeaderView.h"

@interface ViewController ()
@property (nonatomic, retain) NSMutableArray *sections;
@property (nonatomic, retain) NSDictionary *dictionary;
@property (nonatomic, retain) Sections *theSection;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UIButton *but;
@property (nonatomic, retain) IBOutlet UILabel *progressLabel;
@property (nonatomic) NSInteger selectedSection;
@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //get Menu titles
    self.sections = [[NSMutableArray alloc] initWithCapacity:10];
    NSArray *sectionsArray = [Menu setMenuTitles];
    self.dictionary = [SectionArrays addArraysForEachSection:[sectionsArray count] fromSectionRowTitles:sectionsArray toArray:self.sections];
    
    //navBar
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = YES; //for below iOS 7
    //Font for Bar Button Items
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NavBar navBarButtonSetup] forState:UIControlStateNormal];
    //Font for Navigation Bar Title
    [[UINavigationBar appearance] setTitleTextAttributes:[NavBar navBarTitleSetup]];
    
    //design
    self.tableView.rowHeight = [TableHeights rowHeightTable];
    self.view.backgroundColor = [Color colorTwo];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    self.selectedSection = 1100;
    self.progressView.hidden = YES;
    
    //self.but = [HeaderView headerButtonForView:self.tableView];
    //[self.view addSubview:self.but];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self.view addSubview:self.but];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.theSection = [self.dictionary objectForKey:[NSString stringWithFormat:@"%li",(long)section]];
    self.theSection.numberOfRows = [self.theSection.currentTitles count];
    return self.theSection.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    static NSString *CellIdentifier = @"Main";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    [MainCell configureCell:cell];
    self.theSection = [self.dictionary objectForKey:[NSString stringWithFormat:@"%li",(long)[indexPath section]]];
    [[cell textLabel] setText:[self.theSection.currentTitles objectAtIndex:[indexPath row]]];
    
    //for all drop down parts of table change color of background so it's obvious
    if ([indexPath row] >0) {
        [MainCell configureDropCell:cell];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[Color colorTwo]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.theSection = [self.dictionary objectForKey:[NSString stringWithFormat:@"%li",(long)[indexPath section]]];
    NSLog(@"down 1? = %i", self.theSection.down);
    NSLog(@"objectForKey: %@",[NSString stringWithFormat:@"%li",(long)[indexPath section]]);
    //row0
    if ([indexPath row] == 0 && self.theSection.down == NO)
    {
        self.selectedSection = indexPath.section;
        self.theSection.down = [ExpandDown expandSection:self.theSection forCell:cell atIndex:indexPath inTableView:self.tableView];
        NSLog(@"down 2a? = %i", self.theSection.down);
    }
    
    else if ([indexPath row] == 0 && self.theSection.down == YES && [self.theSection.currentTitles count] >1)
    {
        self.theSection.down = [RetractUp retractSection:self.theSection forCell:cell atIndex:indexPath inTableView:self.tableView];

        NSLog(@"down 2b? = %i", self.theSection.down);
        self.selectedSection = 1100; //set to a number far outside the bounds of the number of sections that actually exist
    }
    else if ([[self.theSection.currentTitles objectAtIndex:0] isEqual:@"Sync"] && (indexPath.row == 1))
    {
        [ProgressViewCell addProgressView:self.progressView withWidth:self.view.frame.size.width andHeight:self.tableView.rowHeight];
        [cell.contentView addSubview:self.progressView];
        [ProgressViewCell addProgressLabel:self.progressLabel toView:self.view];
        NSArray *toolbarItems = [ProgressViewCell createToolbarWithLabel:self.progressLabel];
        [self setToolbarItems:toolbarItems animated:NO];
        [ProgressViewCell startProgress:self.progressView inNavController:self.navigationController andView:self.tableView];
    }
    else return;
}

//this means only one section can be selected at time
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // rows in selectedSection should be selectable, or if selectedSection = 1100 (i.e none of the sections are currently selected)
    if(self.selectedSection == 1100 || indexPath.section == self.selectedSection)
    {
        return indexPath;
    }
    //else all other sections/rows should not be selectable
    else return nil;
}



@end
