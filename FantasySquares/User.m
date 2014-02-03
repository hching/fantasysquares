//
//  User.m
//  FantasySquares
//
//  Created by Henry Ching on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import "User.h"
#import <Parse/Parse.h>

@implementation User

- (NSString *)getCurrentUsername {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        return currentUser.username;
    } else {
        return nil;
    }
}

- (NSString *)getCurrentUserEmail {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        return currentUser.email;
    } else {
        return nil;
    }
}

@end
