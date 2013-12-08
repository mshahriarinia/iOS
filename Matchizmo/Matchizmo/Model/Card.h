//
//  Card.h
//  Matchizmo
//
//  Created by Morteza on 12/5/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;
//strong OR weak, nonatomic

@property (nonatomic, getter=isChosen) BOOL chosen; //rename getter
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
