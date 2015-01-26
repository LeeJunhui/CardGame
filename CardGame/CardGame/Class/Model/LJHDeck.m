//
//  LJHDeck.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHDeck.h"

@interface LJHDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation LJHDeck
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(LJHCard *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(LJHCard *)card{
    [self addCard:card atTop:NO];
}

/**
 *  抽牌逻辑 ：先从52张牌里随机选出n张，再复制一遍，即总牌数为2n张，然后将2n张打乱
 */
- (LJHCard *)drawRandomCard
{
    LJHCard *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
