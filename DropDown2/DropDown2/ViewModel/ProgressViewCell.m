//
//  ProgressViewCell.m
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ProgressViewCell.h"
#import "Fonts.h"
#import "Color.h"
#import "Buttons.h"

@implementation ProgressViewCell

+(void)addProgressView:(UIProgressView*)progressView withWidth:(CGFloat)myWidth andHeight:(CGFloat)myY
{
    progressView.frame = CGRectMake(0, myY, myWidth, 10);
    progressView.progress = 0.0;
    
    progressView.center = CGPointMake((myWidth/2),(myY/2));
    progressView.progressTintColor = [UIColor whiteColor];
    progressView.alpha = 0.5;
    
    //use this to make the progress bar thicker
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 15.0f);
    progressView.transform = transform;

}

+(void)addProgressLabel:(UILabel*)progressLabel toView:(UIView*)view
{
    progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, (view.frame.size.width/2), 21.0f)];
    [progressLabel setFont:[UIFont fontWithName:[Fonts fontLight] size:18]];
    [progressLabel setBackgroundColor:[UIColor clearColor]];
    [progressLabel setTextColor:[Color navColor]];
    [progressLabel setTextAlignment:NSTextAlignmentRight];
}

+(NSArray*)createToolbarWithLabel:(UILabel*)progressLabel
{
    UIBarButtonItem *status = [[UIBarButtonItem alloc] initWithCustomView:progressLabel];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //[self.navigationController.toolbar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithTitle:[Buttons cancelButtonTitle] style:UIBarButtonItemStyleBordered target:self action:nil];
    //NEED TO ADD THIS BACK IN TO ACTION @selector(onCancelTapped:)
    NSArray *toolbarItems = [NSArray arrayWithObjects:customItem, spaceItem, status, nil];
    return toolbarItems;
}
@end
