//
//  Card.m
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    // [] and dot notation .contetnts used for properties
    //if used == it compares bare pointers not values. when you have class name you must have *, you cant get memory
    //you can use both [] and dot notation for method
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents])
        {
            score=1;
        }
    }
    return score;
}

@end
