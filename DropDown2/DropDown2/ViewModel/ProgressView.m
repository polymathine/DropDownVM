//
//  ProgressView.m
//  DropDown2
//
//  Created by Abby Schlageter on 12/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ProgressView.h"
#import "FontFactory.h"
#import "Color.h"
#import "Buttons.h"

@interface ProgressView ()
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UINavigationController *controller;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ProgressView
-(instancetype)initProgressView:(UIProgressView*)progressView inView:(UIView*)view withTableView:(UITableView*)tableView withLabel:(UILabel*)label andNavController:(UINavigationController*)controller
{
    if(self = [super init])
    {
        _progressView = progressView;
        _view = view;
        _tableView = tableView;
        _label = label;
        _controller = controller;
    }
    return self;
}

-(void)setUpProgressBarCell:(UITableViewCell*)cell
{
    [self addProgressView:self.progressView withWidth:self.view.frame.size.width andHeight:self.tableView.rowHeight];
    [cell.contentView addSubview:self.progressView];

}


-(void)addProgressView:(UIProgressView*)progressView withWidth:(CGFloat)myWidth andHeight:(CGFloat)myY
{
    progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame = CGRectMake(0, myY, myWidth, 10);
    progressView.progress = 0.0;
    
    progressView.center = CGPointMake((myWidth/2),(myY/2));
    progressView.progressTintColor = [UIColor whiteColor];
    progressView.alpha = 0.5;
    
    //use this to make the progress bar thicker
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 15.0f);
    progressView.transform = transform;
    
}

-(void)launchProgressView
{
    [self startProgressView];
    NSArray *toolbarItems = [self createToolbarWithLabel:self.label];
    [self.controller setToolbarItems:toolbarItems animated:NO];
    [self configureProgressLabel:self.label];
}

-(void)endProgressView
{
    self.tableView.userInteractionEnabled = YES;
    self.progressView.hidden = YES;
    self.controller.toolbarHidden = YES;
}

-(void)configureProgressLabel:(UILabel*)progressLabel
{
    [progressLabel setFont:[UIFont fontWithName:[FontFactory fontLight] size:[FontFactory generalFontSize]]];
    [progressLabel setBackgroundColor:[UIColor clearColor]];
    [progressLabel setTextColor:[Color navColor]];
    [progressLabel setTextAlignment:NSTextAlignmentRight];
}

-(NSArray*)createToolbarWithLabel:(UILabel*)progressLabel
{
    UIBarButtonItem *status = [[UIBarButtonItem alloc] initWithCustomView:progressLabel];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithTitle:[Buttons cancelButtonTitle] style:UIBarButtonItemStyleBordered target:self action:nil];
    //NEED TO ADD THIS BACK IN TO ACTION @selector(onCancelTapped:)
    NSArray *toolbarItems = [NSArray arrayWithObjects:customItem, spaceItem, status, nil];
    return toolbarItems;
}

-(void)startProgressView
{
    self.tableView.userInteractionEnabled = NO;
    self.controller.toolbarHidden = NO;
    self.progressView.hidden = NO;
    self.controller.toolbar.backgroundColor = [UIColor whiteColor];
}



@end
