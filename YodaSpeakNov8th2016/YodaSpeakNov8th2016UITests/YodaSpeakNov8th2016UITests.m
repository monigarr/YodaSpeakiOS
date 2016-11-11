//
//  YodaSpeakNov8th2016UITests.m
//  YodaSpeakNov8th2016UITests
//
//  Created by Monica Peters on 11/8/16.
//  Copyright © 2016 monigarr. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YodaRequestManager.h"
#import "YodaTranslateSentenceModel.h"
#import "AFNetworking.h"
#import "Prefs.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface YodaSpeakNov8th2016UITests : XCTestCase{
    @private
    UIApplication *app;
    AppDelegate *appDelegate;
    ViewController *viewController;
    UIView *view;
}
@end

@implementation YodaSpeakNov8th2016UITests

#pragma mark - Tests
    
- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = [UIApplication sharedApplication];
    viewController = (ViewController *)[[UIApplication sharedApplication] delegate];
    view = viewController.view;
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testEnglishTextView {
    //english textview
    //[viewController textInputMode:[view viewWithTag: 1]];
    
}
 
    
- (void)testEnglishSentenceDeleted {
    
}
    
- (void)testYodaTranslated {
    
}
 
-(void)testYodaImage{
    UIImage *yodaImage = [self _bundledImageNamed:@"yoda_vector" type:@"png"];
    XCTAssertNotNil(yodaImage);
    
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

#pragma mark - Private Helper Methods
    
- (UIImage *)_bundledImageNamed:(NSString *)name type:(NSString *)type{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:name ofType:type];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [[UIImage alloc] initWithData:data];
}
@end
