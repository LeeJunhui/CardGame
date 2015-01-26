//
//  LJHCard.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHCard.h"

@implementation LJHCard
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (LJHCard *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1; }
    }
    return score;
}
@end
