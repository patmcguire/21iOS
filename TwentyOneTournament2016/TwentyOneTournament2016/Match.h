//
//  Match.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 11/5/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Match : NSObject

@property NSString *team1;
@property NSString *team2;
@property NSInteger winner;
@property NSInteger cupDifferential;
@property NSString *objectID;

-(id) init:(NSString *)objectID team1:(NSString *)team1 team2:(NSString *)team2;

@end
