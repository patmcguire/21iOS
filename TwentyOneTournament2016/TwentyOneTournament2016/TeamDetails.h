//
//  TeamDetails.h
//  TwentyOneTournament2016
//
//  Created by Brandon Niedert on 2/9/16.
//  Copyright © 2016 21Tournament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamDetails : NSObject

@property NSInteger wins;
@property NSInteger losses;
@property NSInteger cupDifferential;
@property NSInteger seasons;
@property NSString* player1;
@property NSString* player2;
@property NSString* player3;
@property NSMutableArray* schedule;

-(id) init:(NSInteger)wins losses:(NSInteger)losses cupDifferential:(NSInteger)cupDifferential season:(NSInteger)seasons player1:(NSString *)player1 player2:(NSString *)player2 player3:(NSString *)player3 schedule:(NSMutableArray *)schedule;

@end
