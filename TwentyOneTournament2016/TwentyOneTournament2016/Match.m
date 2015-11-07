//
//  Match.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 11/5/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "Match.h"

@implementation Match

-(id) init:(NSString *)objectID team1:(NSString *)team1 team2:(NSString *)team2
{
    self = [super init];
    if (self)
    {
        self.objectID = objectID;
        self.team1 = team1;
        self.team2 = team2;
        self.winner = 0;
    }
    return self;
}

@end
