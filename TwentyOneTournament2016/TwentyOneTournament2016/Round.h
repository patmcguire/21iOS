//
//  Round.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 11/5/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property NSInteger roundNumber;
@property NSArray *matches;

-(id) init:(NSInteger)roundNumber matches:(NSArray *)matches;

@end
