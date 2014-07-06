//
//  DropDownViewModel.h
//  DropDown2
//
//  Created by Abby Schlageter on 05/07/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menus.h"

@protocol DropDownViewModel <NSObject>

@property (nonatomic, strong) NSDictionary *dictionary;

-(instancetype)initWithMenu:(id<Menus>)menu;


@end
