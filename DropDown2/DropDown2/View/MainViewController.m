//
//  ViewController.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "MainViewController.h"
#import "Color.h"
#import "TableHeights.h"
#import "MainCell.h"
#import "NavFactory.h"
#import "HeaderView.h"
#import "DropCell.h"
#import "ProgressView.h"


@interface MainViewController ()
@property (nonatomic, retain) NSDictionary *dictionary;
@property (nonatomic, retain) Sections *theSection;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UIButton *but;
@property (nonatomic, retain) IBOutlet UILabel *progressLabel;
@property (nonatomic) NSInteger selectedSection;
@property (nonatomic, strong) MainCell *mainCell;
@property (nonatomic, strong) DropCell *dropCell;
@property (nonatomic, strong) ProgressView *progressV;

@end

@implementation MainViewController

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
    
    self.dictionary = self.viewModel.dictionary;
    
    [NavFactory createHomeNav:self.navigationController];
    
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
    return [self.dictionary count];
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
    self.theSection = [self.dictionary objectForKey:[NSString stringWithFormat:@"%li",(long)[indexPath section]]];
    self.mainCell = [[MainCell alloc] init];
    [self.mainCell configureMainCell:cell];
    [[cell textLabel] setText:[self.theSection.currentTitles objectAtIndex:[indexPath row]]];
    
    //for all drop down parts of table change color of background so it's obvious
    if ([indexPath row] >0) {
        self.dropCell = [[DropCell alloc] init];
        [self.dropCell configureDropCell:cell];
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
    self.mainCell = [[MainCell alloc] initMainCellThatHasIndexPath:indexPath inTableView:self.tableView forSection:self.theSection];
    if ([indexPath row] == 0 && self.theSection.down == NO)
    {
        self.selectedSection = indexPath.section;
        self.theSection.down = [self.mainCell expandCellsFrom:cell];
        NSLog(@"down 2a? = %i", self.theSection.down);
    }
    
    else if ([indexPath row] == 0 && self.theSection.down == YES && [self.theSection.currentTitles count] >1)
    {
        self.theSection.down = [self.mainCell retractCellsUpTo:cell];

        NSLog(@"down 2b? = %i", self.theSection.down);
        self.selectedSection = 1100; //set to a number far outside the bounds of the number of sections that actually exist
    }
    else if ([[self.theSection.currentTitles objectAtIndex:0] isEqual:@"Sync"] && (indexPath.row == 1))
    {
        self.progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, (self.view.frame.size.width/2), 21.0f)];
        self.progressV = [[ProgressView alloc] initProgressView:self.progressView inView:self.view withTableView:self.tableView withLabel:self.progressLabel andNavController:self.navigationController];
        [self.progressV setUpProgressBarCell:cell];
        [self.progressV launchProgressView];
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
