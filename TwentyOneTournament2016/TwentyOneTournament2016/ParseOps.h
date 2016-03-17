//
//  ParseOps.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/23/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "TeamDetails.h"

@interface ParseOps : NSObject

+ (ParseOps *)sharedOps;

-(void)runTestOps;
-(NSMutableArray*)getStandings;
-(NSMutableArray*)getRoundSchedule;
-(void)saveMatch:(NSString *)objectID winner:(NSNumber *)winner cd:(NSNumber *)cd;
-(TeamDetails *)getTeamInfo:(NSString *)team;
-(NSMutableArray *)getPlayoffs;

@end
