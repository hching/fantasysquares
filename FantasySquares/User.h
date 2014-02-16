//
//  User.h
//  FantasySquares
//
//  Created by Henry Ching on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : PFObject<PFSubclassing>

@property NSString *username;

+ (NSString *)parseClassName;

@end
