//
//  Event.h
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSMutableArray *eventList;

//+ (NSMutableArray *) getEventList:(NSString *)array;
+ (void) getEventList:(NSString *)array;

@end
