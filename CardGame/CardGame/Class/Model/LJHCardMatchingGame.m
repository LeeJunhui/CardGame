//
//  LJHCardMatchingGame.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHCardMatchingGame.h"
@interface LJHCardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@end
@implementation LJHCardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [NSMutableArray array];
    }
    return _cards;
}


- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(LJHDeck *)deck{
    if (self == [super init]) {
        for (int i = 0; i < count; i ++) {
            LJHCard *card = [deck drawRandomCard];
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

- (LJHCard *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOSE = 2;
- (void)chooseCardAtIndex:(NSUInteger)index{
    LJHCard *card = [self cardAtIndex:index];
    NSLog(@"IsChosen %d IsMatched %d",card.isChosen,card.isMatched);
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else {
            for (LJHCard *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += MATCH_BONUS * matchScore;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        matchScore -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }

    }
}

@end
