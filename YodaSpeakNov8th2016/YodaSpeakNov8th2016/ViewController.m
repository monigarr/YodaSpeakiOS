//
//  ViewController.m
//  YodaSpeakNov8th2016
//
//  Created by Monica Peters on 11/8/16.
//  Copyright © 2016 MoniGarr.com. All rights reserved.
//

#import "ViewController.h"
#import "YodaRequestManager.h"
#import "YodaTranslateSentenceModel.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UITextView *englishTextView;
    @property (weak, nonatomic) IBOutlet UIButton *translateButton;
    @property (weak, nonatomic) IBOutlet UITextView *yodaTextView;
    @property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.englishTextView.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.englishTextView.layer.borderWidth = 2.0f;
    self.englishTextView.layer.cornerRadius = 23;
    
    self.yodaTextView.layer.borderColor = [[UIColor greenColor] CGColor];
    self.yodaTextView.layer.borderWidth = 2.0f;
    self.yodaTextView.layer.cornerRadius = 23;
}

-(void)translateSentence:(NSString *)englishSentence {
    if(englishSentence.length > 0){
        [self blockActivity];
        ViewController __block *blockself = self;
        [[YodaRequestManager sharedInstance] getYodaTranslation:englishSentence success:^(YodaTranslateSentenceModel *translateSentence) {
            if(blockself){
                [blockself unblockActivity];
                blockself.yodaTextView.text = translateSentence.translateSentence;
            }
            
        } failure:^(NSError *error) {
            if (blockself)
            {
                [blockself unblockActivity];
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Error sending request:" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
                [alert addAction:defaultAction];
                [self presentViewController:alert  animated:YES completion:nil];
            }
        }];
    }
}
    
- (IBAction)sendRequestTouch:(id)sender
    {
        [self.englishTextView resignFirstResponder];
        [self translateSentence:self.englishTextView.text];
    }

//during translations
-(void)blockActivity{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = self.view.center;
    [self.activityIndicator startAnimating];
}
    
// Unblock when translation complete
-(void)unblockActivity{
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    if (self.activityIndicator){
        [self.activityIndicator stopAnimating];
        [self.activityIndicator removeFromSuperview];
        self.activityIndicator = nil;
    }
}

@end
