//
//  LoginViewController.m
//  FantasySquares
//
//  Created by Henry Ching on 2/2/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UILabel *loginErrorLabel;

- (IBAction)onSignIn:(id)sender;
- (IBAction)onTap:(id)sender;
@end

@implementation LoginViewController

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

- (IBAction)onSignIn:(id)sender {
    [PFUser logInWithUsernameInBackground:self.usernameText.text password:self.passwordText.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            self.loginErrorLabel.hidden = true;
                                            [self performSegueWithIdentifier:@"signInSuccessSegue" sender:self];
                                        } else {
                                            self.loginErrorLabel.hidden = false;
                                        }
                                    }];
}

- (IBAction)onTap:(id)sender {
    [self.usernameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
}
@end
