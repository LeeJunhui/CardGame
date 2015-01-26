//
//  LJHGameView.h
//  CardGame
//
//  Created by LeeJunHui on 15/1/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJHGameView : UIImageView

@property (nonatomic, assign) NSInteger score;

+ (instancetype)gameView;
/**
 *  添加一个按钮
 */
- (void)addCardButton:(UIButton *)button;


@end
