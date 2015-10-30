//
//  StandingsTeam.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/30/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "StandingsTeam.h"

@implementation StandingsTeam
-(id) init:(NSString *)teamName wins:(NSInteger)wins losses:(NSInteger)losses cupDifferential:(NSInteger)cupDifferential
{
    self = [super init];
    if (self)
    {
        self.teamName = teamName;
        self.wins = wins;
        self.losses = losses;
        self.cupDifferential = cupDifferential;
    }
    return self;
}
@end
