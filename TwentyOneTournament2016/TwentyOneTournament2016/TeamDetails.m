//
//  TeamDetails.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 2/9/16.
//  Copyright © 2016 21Tournament. All rights reserved.
//

#import "TeamDetails.h"

@implementation TeamDetails

-(id) init:(NSInteger)wins losses:(NSInteger)losses cupDifferential:(NSInteger)cupDifferential season:(NSInteger)seasons player1:(NSString *)player1 player2:(NSString *)player2 player3:(NSString *)player3 schedule:(NSMutableArray *)schedule{
    self = [super init];
    if (self)
    {
        self.wins = wins;
        self.losses = losses;
        self.cupDifferential = cupDifferential;
        self.seasons = seasons;
        self.player1 = player1;
        self.player2 = player2;
        self.player3 = player3;
        self.schedule = schedule;
    }
    return self;
}

@end
