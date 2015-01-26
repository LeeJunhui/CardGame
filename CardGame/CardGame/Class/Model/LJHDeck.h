//
//  LJHDeck.h
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJHCard.h"
@interface LJHDeck : NSObject
- (void)addCard:(LJHCard *)card atTop:(BOOL)atTop;
- (void)addCard:(LJHCard *)card;
- (LJHCard *)drawRandomCard;
@end
