//
//  YodaSpeakNov8th2016Tests.m
//  YodaSpeakNov8th2016Tests
//
//  Created by Monica Peters on 11/8/16.
//  Copyright © 2016 monigarr. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "YodaRequestManager.h"
#import "YodaTranslateSentenceModel.h"
#import "AFNetworking.h"
#import "ViewController.h"

@interface YodaTranslateSentenceModel ()
    @property(retain)YodaRequestManager *yodaRequestManager;
@end

@interface YodaSpeakNov8th2016Tests : XCTestCase
    
@end

@implementation YodaSpeakNov8th2016Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
   
- (void)testEnglishTextEntered{
    [tester enterText:@"Hello my name is Yoda"intoViewWithAccessibilityLabel:@"englishTextview"];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
    
- (void)testTranslationPerformance {
    
}

@end
