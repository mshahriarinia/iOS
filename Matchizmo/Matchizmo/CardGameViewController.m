//
//  CardGameViewController.m
//  Matchizmo
//
//  Created by Morteza on 12/4/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

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
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState: UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    //change label on flip change
    
    NSLog(@"Flips: %d",self.flipCount);
}

@end
