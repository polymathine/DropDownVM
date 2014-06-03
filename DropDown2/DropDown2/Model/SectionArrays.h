//
//  SectionArrays.h
//  DropDown2
//
//  Created by Abby Schlageter on 03/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionArrays : NSObject

+(NSDictionary*)addArraysForEachSection:(NSInteger)numberOfSections fromSectionRowTitles:(NSArray*)arrayOfSectionArrays toArray:(NSMutableArray*)sectionsArray;

@end
