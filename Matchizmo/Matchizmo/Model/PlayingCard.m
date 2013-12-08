//
//  PlayingCard.m
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count] == 1){
        //first object won't crash in case of empty array but arr[0] will crash
        PlayingCard *otherCard = [otherCards firstObject];
        if ([self.suit isEqualToString:otherCard.suit]) {
            score +=1;
            NSLog(@"Y");

        }else if (self.rank == otherCard.rank){
            NSLog(@"N");

            score = 4;
        }
    }
    return score;
}

- (NSString *) contents  //override contents from super class
{
    // %d means number, %@ means object
    // return [NSStirng stringWithFormat: @"%d@%d", self.rank, self.suit]
    
    //NSArray is immutable
    // if you put @ infront of string it makes string object for you
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;  //we need to do this because we modified both setter and getter

//override getter of suit
- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

- (void ) setSuit: (NSString *) suit
{
    if( [[PlayingCard validSuits] containsObject:suit])
        _suit=suit;
}

+ (NSArray *) validSuits  //+ is a class method cant use any instance variables. e.g. use it for factory methods, etc.
{
    return @[@"♠", @"♥", @"♦", @"♣"];
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4",@"5",@"6",@"7",@"8",@"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {return [[self rankStrings] count] - 1;}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
@end