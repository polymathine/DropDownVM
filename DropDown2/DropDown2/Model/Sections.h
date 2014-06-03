//
//  Sections.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sections : NSObject
- (id)initSectionWithTitles:(NSArray*)theTitles;

@property (nonatomic, retain) NSArray *titles;
@property (nonatomic, retain) NSMutableArray *currentTitles;
@property (nonatomic) BOOL down;
@property (nonatomic) NSInteger numberOfRows;

@end
