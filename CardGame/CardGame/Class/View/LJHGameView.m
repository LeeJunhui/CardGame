//
//  LJHGameView.m
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LJHGameView.h"
#import "LJHPlayingCard.h"
#import "LJHPlayingCardDeck.h"
#define buttonImageW 40
#define buttonImageH 60
@interface LJHGameView()
@property (strong, nonatomic) LJHDeck *deck;
@property (strong, nonatomic) NSMutableArray *cardButtons;
@property (weak,   nonatomic) UIImageView *bgView;
@property (weak,   nonatomic) UILabel *scoreLabel;
@property (weak,   nonatomic) UILabel *desLabel;
@end
@implementation LJHGameView

- (NSMutableArray *)cardButtons{
    if (!_cardButtons) {
        _cardButtons = [NSMutableArray array];

    }
    return _cardButtons;
}

+ (instancetype)gameView{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"bg.jpg"];
        self.userInteractionEnabled = YES;
        
        UIImageView *bgView = [[UIImageView alloc] init];
        bgView.userInteractionEnabled = YES;
        bgView.image = [UIImage imageNamed:@"table.jpg"];
        bgView.frame = CGRectMake(20, 20, self.frame.size.width - 20 * 2, self.frame.size.height - 20 * 2 - 100);
        [self addSubview:bgView];
        self.bgView = bgView;
        
        UILabel *scoreLabel = [[UILabel alloc] init];
        scoreLabel.text = @"得分";
        scoreLabel.textAlignment = NSTextAlignmentRight;
        scoreLabel.textColor = [UIColor whiteColor];
        scoreLabel.font = [UIFont systemFontOfSize:18];
        scoreLabel.frame = CGRectMake(0, 0, self.frame.size.width - 20 * 2, 20 * 2);
        [self addSubview:scoreLabel];
        self.scoreLabel = scoreLabel;
        
        UILabel *desLabel = [[UILabel alloc] init];
        desLabel.text = @"纸牌配对游戏 游戏规则:每次点击纸牌消耗2分,匹配失败扣2分，匹配成功分两种情况，第一种为花色相同，奖励4分，第二种为大小相同，奖励16分";
        desLabel.textAlignment = NSTextAlignmentCenter;
        desLabel.textColor = [UIColor whiteColor];
        desLabel.numberOfLines = 0;
        desLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:desLabel];
        self.desLabel = desLabel;
        
        
    }
    return self;
}


- (void)addCardButton:(UIButton *)button{
    [self.bgView addSubview:button];
    [self.cardButtons addObject:button];
}

- (LJHDeck *)deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (LJHDeck *)createDeck{
    return  [[LJHDeck alloc] init];
}

- (void)setScore:(NSInteger)score{
    _score = score;
    self.scoreLabel.text = [NSString stringWithFormat:@"得分: %d",(int)score];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.bgView.frame = CGRectMake(20, 20, self.frame.size.width - 20 * 2, self.frame.size.height - 20 * 2 - 80);
    self.desLabel.frame = CGRectMake(20, self.frame.size.height - 160, self.frame.size.width - 20 * 2, 200);
    self.scoreLabel.frame = CGRectMake(20, self.frame.size.height - 40, self.frame.size.width - 20 * 2, 20 * 2);
    
    CGFloat buttonW = buttonImageW;
    CGFloat buttonH = buttonImageH;
    CGFloat buttonMargin = 20;
    CGFloat buttonDelta = 10;
    int maxColumns = 5;
    for (int index = 0; index < self.cardButtons.count; index ++) {
        UIButton *button = self.cardButtons[index];
        
        int row = index / maxColumns;
        int col = index % maxColumns;
        CGFloat buttonX = buttonMargin + (buttonW + buttonDelta) * col;
        CGFloat buttonY = buttonMargin + (buttonH + buttonDelta) * row;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

@end
