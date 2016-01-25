//
//  Match.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 11/5/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "Match.h"

@implementation Match

-(id) init:(NSString *)objectID team1:(NSString *)team1 team2:(NSString *)team2 team1ID:(NSString *)team1ID team2ID:(NSString *)team2ID cd:(NSInteger)cd winner:(NSInteger)winner team1Record:(NSString *)team1Record team2Record:(NSString *)team2Record
{
    self = [super init];
    if (self)
    {
        self.objectID = objectID;
        self.team1 = team1;
        self.team2 = team2;
        self.team1ID = team1ID;
        self.team2ID = team2ID;
        self.winner = winner;
        self.cupDifferential = cd;
        self.team1Record = team1Record;
        self.team2Record = team2Record;
    }
    return self;
}

@end
