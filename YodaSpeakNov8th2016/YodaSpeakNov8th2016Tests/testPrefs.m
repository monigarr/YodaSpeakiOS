//
//  testPrefs.m
//  YodaSpeakNov8th2016
//
//  Created by Monica Peters on 11/10/16.
//  Copyright © 2016 monigarr. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface testPrefs : XCTestCase{
    NSString *PREFS_MASHAPE_YODA_KEY;
    NSString *PREFS_MASHAPE_YODA_KEY_HEADER;
    NSString *PREFS_MASHAPE_YODA_BASE_URL;
    NSString *PREFS_MASHAPE_YODA_BASE_URL_PARAMETERS;
    
}
@end

@implementation testPrefs

- (void)setUp {
    [super setUp];
    PREFS_MASHAPE_YODA_KEY = @"WbqmnR3J1lmshf0Muo81LQyQ9lh0p19CXVtjsnw0m5xWY9OW0m";
    PREFS_MASHAPE_YODA_KEY_HEADER = @"X-Mashape-Key";
    PREFS_MASHAPE_YODA_BASE_URL = @"https://yoda.p.mashape.com/yoda";
    PREFS_MASHAPE_YODA_BASE_URL_PARAMETERS = @"sentence";
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
