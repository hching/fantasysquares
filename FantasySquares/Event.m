//
//  Event.m
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import "Event.h"
#import <Parse/Parse.h>

@implementation Event

// First set up a callback.
- (void)findCallback:(NSArray *)objects error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"Successfully retrieved %d scores.", objects.count);
        // Do something with the found objects
        for (PFObject *object in objects) {
            NSLog(@"%@", object.objectId);
            [self.eventList addObject:object[@"teamOne"]];
        }
    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}

//+ (NSArray *) getEventList:(NSString *)array {
+ (void)getEventList:(NSString *)array {
    //NSMutableArray *eventTitle = [[NSMutableArray alloc] init];

    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query whereKey:@"eventType" equalTo:@"NFL"];
    [query findObjectsInBackgroundWithTarget:self selector:@selector(findCallback:error:)];

    /*
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query whereKey:@"eventType" equalTo:@"NFL"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //[query findObjectsInBackgroundWithTarget:self selector:@selector(getCallback:error:)];
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                NSLog(@"%@", object[@"teamOne"]);
                //[eventTitle addObject:(@"%@", object[@"teamOne"])];
                [eventTitle addObject:object[@"teamOne"]];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        NSLog(@"%@", [eventTitle objectAtIndex:0]);
    }];
     */
}






@end
