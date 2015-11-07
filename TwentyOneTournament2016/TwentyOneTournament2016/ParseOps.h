//
//  ParseOps.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/23/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ParseOps : NSObject

+ (ParseOps *)sharedOps;

-(void)runTestOps;
-(NSMutableArray*)getStandings;
-(NSMutableArray*)getRoundSchedule:(NSInteger)matchesPerRound;

@end
