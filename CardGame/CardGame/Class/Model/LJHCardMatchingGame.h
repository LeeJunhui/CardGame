//
//  LJHCardMatchingGame.h
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJHCard.h"
#import "LJHDeck.h"
@interface LJHCardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(LJHDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (LJHCard *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@end
