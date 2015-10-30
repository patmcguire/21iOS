//
//  ParseOps.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/23/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "ParseOps.h"
#import "StandingsTeam.h"

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
        [Parse setApplicationId:@"2xAc4hfwbGjhN4jLfrrzavL6dNvpS6zazUinq7JM"
                      clientKey:@"5a0K8fv8YxVhaepz7jG6rvfUzr0FTfGHivBSHA2G"];
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
    PFQuery *query = [PFQuery queryWithClassName:@"Team"];
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

@end
