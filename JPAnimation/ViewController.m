//
//  ViewController.m
//  JPAnimation
//
//  Created by PanfuTech on 2018/1/11.
//  Copyright © 2018年 quzhongrensan. All rights reserved.
//

#import "ViewController.h"
#import "LJPWarterDrop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   CGRect frame = self.view.bounds;
    
    LJPWarterDrop *waterDropViewTop = [[LJPWarterDrop alloc]initWithFrame:CGRectMake(0, frame.size.height/2, frame.size.width, frame.size.height/2)];
    [waterDropViewTop addAnimation];
    [self.view addSubview:waterDropViewTop];
    
    LJPWarterDrop *waterDropViewBottom = [[LJPWarterDrop alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/2) direction:LJPDropDirectionDown dropNum:40 color:[UIColor orangeColor] minSize:8 maxSize:20 minLength:50 maxLength:250 minDuration:2 maxDuration:6];
    [waterDropViewBottom addAnimation];
    [self.view addSubview:waterDropViewBottom];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
