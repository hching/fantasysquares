//
//  CreateGameVC.m
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import "CreateGameVC.h"
#import "Game.h"
#import "Event.h"
#import <Parse/Parse.h>

@interface CreateGameVC ()
@property (weak, nonatomic) IBOutlet UITextField *gameTitleTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameTypeSegment;
@property (weak, nonatomic) IBOutlet UITextField *eventTextField;
@property (weak, nonatomic) IBOutlet UISwitch *randomSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *privateGameSwitch;
@property (weak, nonatomic) IBOutlet UIView *pickerContainerView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pickerSelectButton;
@property (weak, nonatomic) IBOutlet UIPickerView *eventPicker;
@property (weak, nonatomic) IBOutlet UIButton *createGameButton;

- (IBAction)onEventSelect:(id)sender;
- (IBAction)onSelectPickerButton:(id)sender;
- (IBAction)onGameTitleSelect:(id)sender;
- (IBAction)onCreateGame:(id)sender;

@property(strong, nonatomic) NSMutableArray *eventListArray;
@property(strong, nonatomic) NSMutableArray *eventIdListArray;

@property(strong, nonatomic) NSString *eventId;

@end

@implementation CreateGameVC

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
    
    self.eventListArray = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query whereKey:@"eventType" equalTo:[self.gameTypeSegment titleForSegmentAtIndex:self.gameTypeSegment.selectedSegmentIndex]];
    [query findObjectsInBackgroundWithTarget:self selector:@selector(findCallback:error:)];
    
    self.eventIdListArray = [[NSMutableArray alloc]
                             initWithObjects: [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:2], nil];
    
    self.pickerContainerView.frame = CGRectMake(0, 460, 320, 261);
}

- (void)findCallback:(NSArray *)objects error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"Successfully retrieved %d scores.", objects.count);
        // Do something with the found objects
        for (PFObject *object in objects) {
            NSLog(@"%@", object.objectId);
            NSLog(@"%@", object[@"teamOne"]);
            [self.eventListArray addObject:[NSString stringWithFormat:@"%@ vs %@", object[@"teamOne"], object[@"teamTwo"]]];
            self.eventId = object.objectId;
        }
    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UIPickerDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.eventListArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.eventListArray objectAtIndex:row];
}

# pragma mark - PickerView Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *event = [self.eventListArray objectAtIndex:row];
    NSInteger eventId = [[self.eventIdListArray objectAtIndex:row] integerValue];
    self.eventTextField.text = event;
}

# pragma mark - Methods

- (IBAction)onEventSelect:(id)sender {
    [self.eventTextField resignFirstResponder];
    self.pickerContainerView.hidden = false;
    [self.eventPicker reloadAllComponents];
    if([self.eventTextField.text isEqual: @"Event"]) {
       //[self.eventPicker selectRow:1 inComponent:0 animated:NO];
       self.eventTextField.text= [self.eventListArray objectAtIndex:[self.eventPicker selectedRowInComponent:0]];
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.pickerContainerView.frame = CGRectMake(0, 200, 320, 261);
    [UIView commitAnimations];
}

- (IBAction)onSelectPickerButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.pickerContainerView.frame = CGRectMake(0, 460, 320, 261);
    [UIView commitAnimations];
}

- (IBAction)onGameTitleSelect:(id)sender {
    self.gameTitleTextField.text = @"";
}

- (IBAction)onCreateGame:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    PFObject *game = [PFObject objectWithClassName:@"Game"];
    game[@"title"] = self.gameTitleTextField.text;
    game[@"ownerId"] = currentUser.objectId;
    game[@"ownerUsername"] = currentUser.username;
    game[@"eventId"] = self.eventId;
    game[@"private"] = (self.privateGameSwitch.on == YES ? @YES : @NO);
    [game saveEventually];
}



@end
