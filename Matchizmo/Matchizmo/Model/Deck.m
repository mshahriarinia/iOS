//
//  Deck.m
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "Deck.h"

@interface Deck() //???? or @interface Deck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray *) cards
{ //allocate & init memory in heap in the getter
    //lazy instanciation rather than in construct to instanciate all at once
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}



- (void)addCard: (Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *) card;
{
    [self addCard:card atTop:NO];
}

- (Card*) drawRandomCard
{
    Card *randomCard = nil;
    
    if([self.cards count])
    { //if not empty or null
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex: index];
    }
    return randomCard;
}


@end
