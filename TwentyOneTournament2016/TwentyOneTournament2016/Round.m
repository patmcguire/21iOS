//
//  Round.m
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 11/5/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import "Round.h"

@implementation Round

-(id) init:(NSInteger)roundNumber matches:(NSArray *)matches
{
    self = [super init];
    if (self)
    {
        self.roundNumber = roundNumber;
        self.matches = matches;
    }
    return self;
}

@end
