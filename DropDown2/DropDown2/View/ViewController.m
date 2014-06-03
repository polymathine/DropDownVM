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
#import "Logos.h"
#import "Color.h"
#import "Buttons.h"
#import "Fonts.h"
#import "TableHeights.h"
#import "MainCell.h"

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
    self.navigationItem.hidesBackButton = YES;
    
    self.progressView.hidden = YES;
    NSArray *sect0 = [[NSArray alloc] initWithObjects:@"Scan", @"Scan Now", nil];
    NSArray *sect1 = [[NSArray alloc] initWithObjects:@"Sync", @"Sync Now", nil];
    NSArray *sect2 = [[NSArray alloc] initWithObjects:@"Settings", @"Write",@"Setup", nil];
    
    self.sections = [[NSMutableArray alloc] initWithCapacity:10];
    NSArray *sectionsArray =[[NSArray alloc] initWithObjects:sect0, sect1, sect2, nil];
    
    self.dictionary = [SectionArrays addArraysForEachSection:[sectionsArray count] fromSectionRowTitles:sectionsArray toArray:self.sections];
    
    //navBar
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = YES; //for below iOS 7
    
    //design

    self.tableView.rowHeight = [TableHeights rowHeightTable];
    self.view.backgroundColor = [Color colorTwo];
    UIView *headerView =  [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, 160.0)];
    self.tableView.tableHeaderView = headerView;
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    //Font for Bar Button Items
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [attributes setValue:[UIFont fontWithName:[Fonts fontBold] size:[Fonts smallFontSize]] forKey:UITextAttributeFont];
    [attributes setValue:[Color fontColor] forKey:UITextAttributeTextColor];
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    //Font for Navigation Bar Title
    NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionaryWithDictionary: [[UINavigationBar appearance] titleTextAttributes]];
    [titleAttributes setValue:[UIFont fontWithName:[Fonts fontLight] size:[Fonts generalFontSize]] forKey:UITextAttributeFont];
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
    
    
    self.selectedSection = 1100;
    self.progressView.hidden = YES;
    
    self.but=[UIButton buttonWithType:UIButtonTypeCustom];
    self.but.frame= CGRectMake(0.0, 20.0, 320.0, 120.0);
    
    [self.but setImage:[UIImage imageWithContentsOfFile:[Logos mainLogo]] forState:UIControlStateNormal];
    [self.view addSubview:self.but];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self.view addSubview:self.but];
}


- (void) onUpdateProgress:(float)progress
{
    //delgate method from ServerySyncs
    NSLog(@"delegate in SyncVC working!");
    [self.progressView setProgress:progress];
}

-(void) updateProgressLabelTo:(NSString*)label
{
    self.progressLabel.text = label;
}

-(void)routineCompleted
{
    self.tableView.userInteractionEnabled = YES;
    self.progressView.hidden = YES;
    self.navigationController.toolbarHidden = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[Color colorTwo]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    self.theSection = [self.dictionary objectForKey:[NSString stringWithFormat:@"%li",(long)section]];
    self.theSection.numberOfRows = [self.theSection.currentTitles count];
    rows = self.theSection.numberOfRows;
    
    return rows;
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
        [[cell textLabel] setTextColor:[UIColor whiteColor]];
        [cell.textLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:40]];
        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.accessoryView = Nil;
    }
    
    return cell;
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
        self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
        
        CGFloat myY = (self.tableView.rowHeight);
        CGFloat myWidth = self.view.frame.size.width;
        
        [ProgressViewCell addProgressView:self.progressView withWidth:myWidth andHeight:myY];
        
        [cell.contentView addSubview:self.progressView];
        [self showProgressBarAndToolbar];
        
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


-(void)showProgressBarAndToolbar
{
    self.tableView.userInteractionEnabled = NO;
    self.navigationController.toolbarHidden = NO;
    self.progressView.hidden = NO;
    
    [ProgressViewCell addProgressLabel:self.progressLabel toView:self.view];
    NSArray *toolbarItems = [ProgressViewCell createToolbarWithLabel:self.progressLabel];
    
    [self setToolbarItems:toolbarItems animated:NO];
    self.navigationController.toolbar.backgroundColor = [UIColor whiteColor];
    
}



@end
