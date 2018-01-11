//
//  LJPWarterDrop.m
//  JPAnimation
//
//  Created by PanfuTech on 2018/1/11.
//  Copyright © 2018年 quzhongrensan. All rights reserved.
//

#import "LJPWarterDrop.h"

@interface ViewConfig : NSObject

@property (nonatomic ,strong) UIColor *color;
@property (nonatomic ,assign) CGFloat minDropSize;
@property (nonatomic ,assign) CGFloat maxDropSize;
@property (nonatomic ,assign) CGFloat minLength;
@property (nonatomic ,assign) CGFloat maxLength;
@property (nonatomic ,assign) NSTimeInterval minDuration;
@property (nonatomic ,assign) NSTimeInterval maxDuration;

@end

@implementation ViewConfig


@end

@implementation LJPWarterDrop

- (instancetype) initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        self.dropNum = 30;
        self.dropColor = [UIColor redColor];
        self.minDropSize = 10;
        self.maxDropSize = 20;
        self.minLength = 50;
        self.maxLength = 200;
        self.minDuration = 1;
        self.maxDuration = 5;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame direction:(LJPDropDirection)direct dropNum:(NSUInteger)num color:(UIColor *)color minSize:(CGFloat)minSize maxSize:(CGFloat)maxSize minLength:(CGFloat)minLen maxLength:(CGFloat)maxLen minDuration:(NSTimeInterval)minDuration maxDuration:(NSTimeInterval)maxDuration{
    self  = [super initWithFrame:frame];
    if (self) {
        self.dropNum = num;
        self.dropDirection = direct;
        self.dropColor = color;
        self.minDropSize = minSize;
        self.maxDropSize = maxSize;
        self.minLength = minLen;
        self.maxLength = maxLen;
        self.minDuration = minDuration;
        self.maxDuration = maxDuration;
    }
    return self;
    
}

- (void) addAnimation{
    ViewConfig *config =  [[ViewConfig alloc] init];
    config.color = self.dropColor;
    config.minLength = self.minLength;
    config.maxLength = self.maxLength;
    config.minDropSize = self.minDropSize;
    config.maxDropSize = self.maxDropSize;
    config.minDuration = self.minDuration;
    config.maxDuration = self.maxDuration;
    [self generateRandomWaterDrops:self.dropNum config:config direction:self.dropDirection];
}

- (void)generateRandomWaterDrops:(NSUInteger)num config:(ViewConfig *)config direction:(LJPDropDirection)direct{
    for (int i =0 ; i < num; i++) {
        [self randomWaterDrop:config direction:direct];
    }
}

- (void) randomWaterDrop:(ViewConfig *)config direction:(LJPDropDirection)direct{
    
   CGFloat randomX = arc4random_uniform(self.frame.size.width);
    CGFloat randomSize = arc4random_uniform(config.maxDropSize - config.minDropSize) + config.minDropSize;
    
    NSTimeInterval randomDuration = arc4random_uniform(config.maxDuration - config.minDuration) + config.minDuration;
    
    CGFloat randomLength = arc4random_uniform(config.maxLength - config.minLength) + config.minLength;
   
    CGFloat length = LJPDropDirectionUp == direct?-randomLength : randomLength;
    
    CGFloat positionY = LJPDropDirectionUp == direct?self.frame.size.height :  -randomSize;
    
    __block UIView *drop = [UIView new];
    drop.frame = CGRectMake(randomX, positionY, randomSize, randomSize);
    drop.backgroundColor = config.color;
    drop.layer.cornerRadius = randomSize/2;
    [self addSubview:drop];
  
    [UIView animateWithDuration:randomDuration animations:^{
       CGRect frame = drop.frame;
        frame.origin.y += length;
        drop.frame = frame;
        drop.alpha = 0.00;
    } completion:^(BOOL finished) {
        if (finished) {
            drop = nil;
            [self randomWaterDrop:config direction:direct];
        }
    }];

}

@end


