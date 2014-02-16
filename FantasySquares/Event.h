//
//  Event.h
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Event : PFObject<PFSubclassing>

//@property (strong, nonatomic) NSMutableArray *eventList;

@property NSString *teamOne;
@property NSString *teamTwo;
@property NSString *eventType;
@property NSDate *eventTime;

+ (NSString *)parseClassName;

//+ (NSMutableArray *) getEventList:(NSString *)array;
//+ (void) getEventList:(NSString *)array;

@end
