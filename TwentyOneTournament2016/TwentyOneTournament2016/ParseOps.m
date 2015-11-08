//
//  ParseOps.m
//  TwentyOneTournament2016
//
//  Need to make a class for matches and rounds.  One method to retrieve all matches in a round,
//  and return an array of rounds to the view controller for us
//
//  Created by Brandon Niedert on 10/23/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "ParseOps.h"
#import "StandingsTeam.h"
#import "Match.h"
#import "Round.h"

@interface ParseOps()

@end

@implementation ParseOps

static ParseOps *sharedOps = nil;

+ (ParseOps *)sharedOps
{
    if (sharedOps == nil){
        sharedOps = [[super allocWithZone:NULL] init];
    }
    return sharedOps;
}

- (id)init
{
    self = [super init];
    if (self) {
        [Parse setApplicationId:@"uqmvXiqFfCkv2wwVMm1BGFrVuGqTlPjxbivHSM4N"
                      clientKey:@"Q0hNnGIe0M643J8cQf6AfAVgsvRhMUh0mSa36nTI"];
    }
    return self;
}

-(void)runTestOps
{
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    NSLog(@"The test has been run");
}

-(void)printTeams:(NSArray*)teams
{
    NSLog(@"%lu", teams.count);
}


-(NSMutableArray*)getStandings
{
    NSMutableArray* teamArray = [[NSMutableArray alloc]init];
    PFQuery *query = [PFQuery queryWithClassName:@"TeamOld"];
    [query addDescendingOrder:@"wins"];
    [query addDescendingOrder:@"CD"];
    NSArray* teams = [query findObjects];
    for (PFObject *team in teams)
    {
        NSString *name = team[@"teamName"];
        NSString *wins = team[@"wins"];
        NSString *losses = team[@"losses"];
        NSString *CD = team[@"CD"];
        StandingsTeam *standingsTeam = [[StandingsTeam alloc] init:name wins:[wins intValue] losses:[losses intValue] cupDifferential:[CD intValue]];
        [teamArray addObject:standingsTeam];
    }
    return teamArray;
}

-(NSMutableArray*)getRoundSchedule:(NSNumber *)numberOfRounds
{
    //new thread for each round idea?
    NSMutableArray *scheduleArray = [[NSMutableArray alloc]init];
    NSNumber *currentRound = @1;
    while (currentRound <= numberOfRounds) {
        NSMutableArray *roundArray = [[NSMutableArray alloc]init];
        PFQuery *query = [PFQuery queryWithClassName:@"MatchOld"];
        [query whereKey:@"RoundNumber" equalTo:currentRound];
        [query addAscendingOrder:@"matchNumber"];
        NSArray *matches = [query findObjects];
        for (PFObject *match in matches)
        {
            Match *currentMatch = [[Match alloc] init:[match objectId] team1:match[@"Team1"] team2:match[@"Team2"]];
            [roundArray addObject:currentMatch];
            //NSLog(@"%@ vs %@", team1, team2);
        }
        Round *round = [[Round alloc] init:[currentRound intValue] matches:roundArray];
        [scheduleArray addObject:round];
        currentRound = [NSNumber numberWithInt:[currentRound intValue] + 1];
    }
    return scheduleArray;
}

@end
