//
//  Game.h
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Game : PFObject<PFSubclassing>

@property NSString *title;
@property NSString *ownerId;
@property NSString *ownerUsername;
@property NSString *eventId;
@property NSNumber *random;
@property NSNumber *private;
@property PFUser *user;

+ (NSString *)parseClassName;

@end
