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
            PFQuery *recordQuery = [PFQuery queryWithClassName:@"TeamOld"];
            [recordQuery whereKey:@"teamName" equalTo:match[@"Team1"]];
            NSArray *team = [recordQuery findObjects];
            NSLog(@"%@ vs %@\n",match[@"Team1"], match[@"Team2"]);
            NSString *wins = team[0][@"wins"];
            NSString *losses = team[0][@"losses"];
            NSString *team1Record = [NSString stringWithFormat:@"%@-%@", wins, losses];
            [recordQuery whereKey:@"teamName" equalTo:match[@"Team2"]];
            team = [recordQuery findObjects];
            wins = team[0][@"wins"];
            losses = team[0][@"losses"];
            NSString *team2Record = [NSString stringWithFormat:@"%@-%@", wins, losses];
            Match *currentMatch = [[Match alloc] init:[match objectId] team1:match[@"Team1"] team2:match[@"Team2"] team1ID:match[@"Team1ID"] team2ID:match[@"Team2ID"] cd:[match[@"CD"] intValue] winner:[match[@"Winner"] intValue] team1Record:team1Record team2Record:team2Record];
            [roundArray addObject:currentMatch];
        }
        Round *round = [[Round alloc] init:[currentRound intValue] matches:roundArray];
        [scheduleArray addObject:round];
        currentRound = [NSNumber numberWithInt:[currentRound intValue] + 1];
    }
    return scheduleArray;
}

-(void)saveMatch:(NSString *)objectID winner:(NSNumber *)winner cd:(NSNumber *)cd
{
    PFQuery *query = [PFQuery queryWithClassName:@"MatchOld"];
    PFObject *match = [query getObjectWithId:objectID];
    match[@"Winner"] = winner;
    match[@"CD"] = cd;
    [match save];
    NSLog(@"Match saved");
    [self startStandingsUpdate:match];
    //TODO: Update the match itself in the schedule view controller
}

-(void)startStandingsUpdate:(PFObject *)match
{
    NSString *team1ID = match[@"Team1ID"];
    NSString *team2ID = match[@"Team2ID"];
    NSNumber *cd = match[@"CD"];
    
    [match[@"Winner"] intValue] == 1 ? [self updateStandings:team1ID loser:team2ID cd:cd] : [self updateStandings:team2ID loser:team1ID cd:cd];
    
}

-(void)updateStandings:(NSString *)winner loser:(NSString *)loser cd:(NSNumber *)cd
{
    PFQuery *query = [PFQuery queryWithClassName:@"TeamOld"];
    
    PFObject *team = [query getObjectWithId:winner];
    NSInteger wins = [team[@"wins"] intValue];
    NSInteger cdWinner = [team[@"CD"] intValue];
    wins++;
    cdWinner = cdWinner + cd.intValue;
    team[@"wins"] = [NSNumber numberWithLong:wins];
    team[@"CD"] = [NSNumber numberWithLong:cdWinner];
    [team save];
    
    team = [query getObjectWithId:loser];
    NSInteger losses = [team[@"losses"] intValue];
    NSInteger cdLoser = [team[@"CD"] intValue];
    losses++;
    cdLoser = cdLoser - cd.intValue;
    team[@"losses"] = [NSNumber numberWithLong:losses];
    team[@"CD"] = [NSNumber numberWithLong:cdLoser];
    [team save];
    
    NSLog(@"Standings Updated");
}


@end
