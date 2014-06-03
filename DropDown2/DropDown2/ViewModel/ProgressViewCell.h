//
//  ProgressViewCell.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressViewCell : NSObject

+(void)addProgressView:(UIProgressView*)progressView withWidth:(CGFloat)myWidth andHeight:(CGFloat)myY;
+(void)addProgressLabel:(UILabel*)progressLabel toView:(UIView*)view;
+(NSArray*)createToolbarWithLabel:(UILabel*)progressLabel;

@end
