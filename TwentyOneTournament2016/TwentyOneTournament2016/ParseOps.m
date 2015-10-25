//
//  ParseOps.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/23/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "ParseOps.h"
@interface ParseOps()

@end

@implementation ParseOps

- (instancetype)init
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

-(void)getTeam
{
    
}

-(void)getTeams
{
    
}

-(void)getMatch
{
    
}

-(void)getMatches
{
    
}

-(void)getRound
{
    
}

-(void)getRounds
{
    
}

@end
