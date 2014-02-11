//
//  Game.h
//  FantasySquares
//
//  Created by Minh Nguyen on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (strong, nonatomic) NSString *gameTitle;
@property (strong, nonatomic) NSString *eventTitle;
@property (strong, nonatomic) NSNumber *eventId;
@property (strong, nonatomic) NSString *randamFlag;
@property (strong, nonatomic) NSString *privateFlag;

@end
