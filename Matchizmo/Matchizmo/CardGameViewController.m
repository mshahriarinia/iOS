//
//  CardGameViewController.m
//  Matchizmo
//
//  Created by Morteza on 12/4/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

//UIButton is something for XCode and compiler ignores it. just to track what might be part of this collection
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardCollections;


@end

@implementation CardGameViewController

- (CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardCollections count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

- (Deck *) deck
{
    if(!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

//IBAction is equal to oid it's just a syntactic sugar for XCode to show a dot on right
//for hover over operation.
//Argument is the button sending this message
- (IBAction)touchCardButton:(UIButton *)sender
{
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState: UIControlStateNormal];
        
        //class method loads named image
        //forState:UIControlStateNormal could also be  default, highlighted, selected, disabled
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
        
    }else{
        
        Card *card = [self.deck drawRandomCard] ;
        if(card){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState: UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
    
    //--------------------------------
    
    int cardIndex = [self.cardCollections indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI]; // keep UI in sync with the model
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardCollections) {
        int cardIndex = [self.cardCollections indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *) titleForCard:(Card *)card
{
    return card.isChosen ? card.contents  : @"";
}

- (UIImage *) backgroundImageForCard:(Card *) card //in naming convention keep the parameter in name
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    //change label on flip change
    
    NSLog(@"Flips: %d",self.flipCount);
}

@end
