//
//  LJPWarterDrop.h
//  JPAnimation
//
//  Created by PanfuTech on 2018/1/11.
//  Copyright © 2018年 quzhongrensan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , LJPDropDirection) {
    LJPDropDirectionUp,
    LJPDropDirectionDown
};

@interface LJPWarterDrop : UIView

@property (nonatomic , assign) NSUInteger dropNum;
@property (nonatomic , assign) LJPDropDirection dropDirection;
@property (nonatomic , strong) UIColor *dropColor;
@property (nonatomic , assign) NSUInteger maxDropSize;
@property (nonatomic , assign) NSUInteger minDropSize;
@property (nonatomic , assign) NSUInteger maxLength;
@property (nonatomic , assign) NSUInteger minLength;
@property (nonatomic , assign) NSTimeInterval maxDuration;
@property (nonatomic , assign) NSTimeInterval minDuration;

- (instancetype)initWithFrame:(CGRect)frame direction:(LJPDropDirection)direct dropNum:(NSUInteger)num color:(UIColor *)color minSize:(CGFloat)minSize maxSize:(CGFloat)maxSize minLength:(CGFloat)minLen maxLength:(CGFloat)maxLen minDuration:(NSTimeInterval)minDuration maxDuration:(NSTimeInterval)maxDuration;

- (void) addAnimation;
@end

