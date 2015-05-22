//
//  WebViewController.m
//  AssessmentSecondWeek
//
//  Created by Mark Porcella on 5/22/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;



@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLRequest *urlRequest = [[NSURLRequest alloc ] initWithURL:self.webURL];
    [self.webView loadRequest:urlRequest];

}
- (IBAction)onDissmissTapped:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
