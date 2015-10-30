//
//  StandingsTeam.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 10/30/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StandingsTeam : NSObject

@property NSString *teamName;
@property NSInteger wins;
@property NSInteger losses;
@property NSInteger cupDifferential;

-(id) init:(NSString *)teamName wins:(NSInteger)wins losses:(NSInteger)losses cupDifferential:(NSInteger)cupDifferential;

@end
