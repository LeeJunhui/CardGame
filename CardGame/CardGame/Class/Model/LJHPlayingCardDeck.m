//
//  LJHPlayingCardDeck.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHPlayingCardDeck.h"
#import "LJHPlayingCard.h"
@implementation LJHPlayingCardDeck
- (instancetype)init{
    if (self == [super init]) {
        for (NSString *suit in [LJHPlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= 7; rank++) {
                LJHPlayingCard *card = [[LJHPlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}



//for (int i = 0; i < 2; i++) {
//    NSUInteger rank = (NSUInteger)(arc4random() % [LJHPlayingCard maxRank]);
//    if (rank == 0) {
//        rank ++;
//    }
//    LJHPlayingCard *card = [[LJHPlayingCard alloc] init];
//    card.suit = suit;
//    card.rank = rank;
//    [self addCard:card];
//}


@end
