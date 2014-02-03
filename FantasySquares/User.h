//
//  User.h
//  FantasySquares
//
//  Created by Henry Ching on 2/3/14.
//  Copyright (c) 2014 YahooHenry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong, readonly) NSString *getCurrentUserName;
@property (nonatomic, strong, readonly) NSString *getCurrentUserEmail;

@end
