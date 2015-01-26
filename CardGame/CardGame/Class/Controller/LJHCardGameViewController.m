//
//  LJHCardGameViewController.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHCardGameViewController.h"
#import "LJHGameView.h"
#import "LJHCardMatchingGame.h"
#import "LJHDeck.h"
#import "LJHPlayingCardDeck.h"
#import "LJHPlayingCard.h"
@interface LJHCardGameViewController ()
@property (weak, nonatomic) LJHGameView *gameView;
@property (strong, nonatomic) LJHCardMatchingGame *game;
@property (strong, nonatomic) LJHDeck *deck;
@property (strong, nonatomic) NSMutableArray *cardButtons;
@end

@implementation LJHCardGameViewController

- (LJHGameView *)gameView{
    if (!_gameView) {
        _gameView = [LJHGameView gameView];
        _gameView.frame = self.view.bounds;
    }
    return _gameView;
}

- (LJHCardMatchingGame *)game{
    if (!_game) {
        _game = [[LJHCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (LJHDeck *)deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (LJHDeck *)createDeck{
    return  [[LJHPlayingCardDeck alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupGameView];
}


- (void)setupGameView{
    LJHGameView *gameView = [[LJHGameView alloc] init];
    gameView.frame = self.view.bounds;
    [self.view addSubview:gameView];
    self.gameView = gameView;
    
    self.cardButtons = [NSMutableArray array];
    [self addButtons];
}

- (void)addButtons{
    for (int i = 0 ; i < 30; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width * 0.5, button.currentBackgroundImage.size.height * 0.5);
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.gameView addCardButton:button];
        [self.cardButtons addObject:button];
    }
}

- (void)buttonClick:(UIButton *)button{
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:button];
    [self.game chooseCardAtIndex:chooseButtonIndex];
//    NSLog(@"%d",(int)chooseButtonIndex);.
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
        LJHCard *card = [self.game cardAtIndex:cardButtonIndex];
//        NSLog(@"得分：%d",(int)self.game.score);
        self.gameView.score = self.game.score;
        [cardButton setBackgroundImage:[self backgroundImageForCard:(LJHPlayingCard *)card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
}

- (UIImage *)backgroundImageForCard:(LJHPlayingCard *)card{
//    NSLog(@"%d %d",card.isChosen,card.isMatched);
    NSString *imageName = [NSString stringWithFormat:@"%@%d",card.suit,(int)card.rank];
    return [UIImage imageNamed:card.isChosen ? imageName : @"back" ];
}


@end
