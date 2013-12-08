//
//  CardMatchingGame.h
//  Matchizmo
//
//  Created by Morteza on 12/8/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated intializer. The subclass has to call this to make sure it has called its parents init.
- (instancetype) initWithCardCount:(NSUInteger) count usingDeck:(Deck *) deck;

- (void) chooseCardAtIndex:(NSUInteger) index;

- (Card *) cardAtIndex: (NSUInteger) index;

//readonly: no public setter
@property (nonatomic, readonly) NSInteger score;

@end
