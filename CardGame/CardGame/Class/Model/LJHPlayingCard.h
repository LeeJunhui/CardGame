//
//  LJHPlayingCard.h
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJHCard.h"
@interface LJHPlayingCard : LJHCard
//花色
@property (strong, nonatomic) NSString *suit;
//大小
@property (assign, nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
