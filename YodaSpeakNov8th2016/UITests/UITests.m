//
//  UITests.m
//  UITests
//
//  Created by Monica Peters on 11/10/16.
//  Copyright © 2016 MoniGarr.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UITests : XCTestCase{
    @private
    UIApplication *app;
}

@end

@implementation UITests

#pragma mark - Tests

- (void)setUp {
    [super setUp];
    
    app = [UIApplication sharedApplication];
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    /*
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *englishTextView = app.textViews[@"englishTextView"];
    XCUIElement *yodaTextView = app.textViews[@"yodaTextView"];
    
    
    [englishTextView tap];
    [englishTextView typeText:@"hello my name is Monica"];
    [app.buttons[@"translateButton"] tap];
*/
}

    
-(void)testYodaImage{
    UIImage *yodaImage = [self _bundledImageNamed:@"yoda_vector" type:@"png"];
    XCTAssertNotNil(yodaImage);
    
}
    
#pragma mark - Private Helper Methods
    
- (UIImage *)_bundledImageNamed:(NSString *)name type:(NSString *)type{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:name ofType:type];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [[UIImage alloc] initWithData:data];
}
    
@end
