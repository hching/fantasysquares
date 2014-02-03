//
//  SignUpViewController.m
//  FantasySquares
//
//  Created by Henry Ching on 2/2/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;

- (IBAction)onTap:(id)sender;
- (IBAction)onSignUp:(id)sender;

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.usernameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    [self.emailText resignFirstResponder];
}

- (IBAction)onSignUp:(id)sender {
    if(self.usernameText != nil && self.passwordText != nil && self.emailText != nil) {
        PFUser *user = [PFUser user];
        user.username= self.usernameText.text;
        user.password= self.passwordText.text;
        user.email = self.emailText.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
        }];
    }
}

@end
