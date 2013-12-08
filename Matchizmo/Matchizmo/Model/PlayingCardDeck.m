//
//  PlayingCardDeck.m
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"


@implementation PlayingCardDeck
- (instancetype) init   //constructor method inherited from NSObject
{
    self = [super init];
    if(self)   //don't assign anything to self except in init here -- check to make sure it is properly initialized.
    {
        for(NSString *suit in [PlayingCard validSuits] ){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
