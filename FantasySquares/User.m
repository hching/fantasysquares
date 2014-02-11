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

- (NSString *)getCurrentUserId {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        return currentUser.objectId;
    } else {
        return nil;
    }
}

- (NSString *)getCurrentUserName {
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
