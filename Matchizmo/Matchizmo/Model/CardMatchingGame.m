//
//  CardMatchingGame.m
//  Matchizmo
//
//  Created by Morteza on 12/8/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardMatchingGame.h"

//private interface to redeclare sth from readonly to readwrite
@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of cards : there no way to force type compile time

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (! _cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return ([self.cards count] > index) ? self.cards[index] : nil;
}

//#define MISMATCH_PENALTY 2 //not typed, just substituting
static const int MISMATCH_PENALTY = 2;
static const int MISMATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (! card.isMatched) {
        if (card.isChosen) { //getter setter for chosen
            card.chosen = NO;  //toggle chosen (unchoose it)
        } else {
            //match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.matched) {
                    int matchScore = [card match:@[otherCard]]; //inline array declaration
                    NSLog(@"%d", matchScore);
                    if(matchScore){
                        self.score += matchScore * MISMATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }
                    else{
                        self.score -= MISMATCH_PENALTY; //constant
                        otherCard.chosen = NO;
                        
                    }
                    break;
                    
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.Chosen = YES;
        }
    }
}



//void the default initializer
- (instancetype) init
{
    return nil;
}

@end
