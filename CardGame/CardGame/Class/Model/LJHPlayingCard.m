//
//  LJHPlayingCard.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//
#import "LJHPlayingCard.h"

@implementation LJHPlayingCard

@synthesize suit = _suit; //因为我们自己自定义了setter和getter，那么就要synthesize一下

/**
 *  匹配纸牌 (因为匹配大小比匹配花色更难，其难易程度为4倍，所以分数也为4倍)
 */
- (int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        LJHPlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.suit == self.suit) {
            score = 1;
            NSLog(@"suit match!");
        }
        if (otherCard.rank == self.rank) {
            score = 4;
            NSLog(@"rank match!");
        }
    }
    return score;
}

- (NSString *)contents{
    NSArray *rankStrings = [LJHPlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits{
    return @[@"club",@"diamond",@"hearts",@"spade"];
}

//如果suit为空则直接赋值为？
- (NSString *)suit{
    return _suit ? _suit : @"?";
}


- (void)setSuit:(NSString *)suit{
    if ([[LJHPlayingCard validSuits] containsObject:suit] ) {
        _suit = suit;
    }
}

+ (NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [LJHPlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
