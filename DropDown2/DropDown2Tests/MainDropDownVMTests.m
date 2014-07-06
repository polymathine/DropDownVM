//
//  MainDropDownVMTests.m
//  DropDown2
//
//  Created by Abby Schlageter on 05/07/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MainDropDownVM.h"

@interface MainDropDownVMTests : XCTestCase

@end

@implementation MainDropDownVMTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_tableViewLoads
{
    MainDropDownVM *mainDropDownVM = [[MainDropDownVM alloc] init];
    //XCTAssertNotNil(mainDropDownVm.tableView, nil);
}

@end
