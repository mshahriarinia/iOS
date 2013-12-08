//
//  Deck.h
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *) card atTop:(BOOL)atTop;
- (void) addCard:(Card *) card;

- (Card *) drawRandomCard;

@end
