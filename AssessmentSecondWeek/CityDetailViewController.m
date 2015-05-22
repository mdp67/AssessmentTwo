//
//  CityDetailViewController.m
//  AssessmentSecondWeek
//
//  Created by Mark Porcella on 5/22/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebViewController.h"

@interface CityDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;

@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *cityStateNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *showWebLabel;

@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityNameTextField.text = self.city.cityName;
    self.cityStateNameTextField.text = self.city.state;
    self.cityImageView.image = self.city.cityImage;
    self.cityNameTextField.delegate = self;
    self.cityStateNameTextField.delegate = self;

}
- (IBAction)cityStateNameEndEditing:(UITextField *)sender {

    self.city.cityName = self.cityNameTextField.text;

}

- (IBAction)cityNameEndEditing:(UITextField *)sender {

    self.city.state = self.cityStateNameTextField.text;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [self.cityStateNameTextField resignFirstResponder];
    [self.cityStateNameTextField resignFirstResponder];
    return YES;
}


- (IBAction)onSetTitleButtonTapped:(UIButton *)sender {
    [self.delegate cityDetailViewController:self cityName:self.city.cityName];

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
         NSLog(@"tapped");
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *vc = segue.destinationViewController;
    vc.webURL = self.city.cityURL;

}









@end
