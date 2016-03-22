//
//  ViewController.m
//  Animation
//
//  Created by 樊琳琳 on 16/1/21.
//  Copyright © 2016年 fll. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_imageView];
    
    _imageView.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *top=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(top:)];
    [_imageView addGestureRecognizer:top];
    
}
-(void)top:(UITapGestureRecognizer *)top
{
//    两个动画同时执行
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:10.0];
//    [_imageView setAlpha:0.5];//透明度
//    [UIView commitAnimations];
//    
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:10.0];
//    CGPoint point = _imageView.center;
//    point.y +=150;
//    [_imageView setCenter:point];
//    [UIView commitAnimations];
    
    
    void (^keyFrameBlock)() = ^(){
        // 创建颜色数组
        NSArray *arrayColors = @[[UIColor orangeColor],
                                 [UIColor yellowColor],
                                 [UIColor greenColor],
                                 [UIColor blueColor],
                                 [UIColor purpleColor],
                                 [UIColor redColor]];
        NSUInteger colorCount = [arrayColors count];
        // 循环添加关键帧
        for (NSUInteger i = 0; i < colorCount; i++) {
            [UIView addKeyframeWithRelativeStartTime:i / (CGFloat)colorCount
                                    relativeDuration:1 / (CGFloat)colorCount
                                          animations:^{
                                              [_imageView setBackgroundColor:arrayColors[i]];
                                          }];
        }
    };
    
    
    [UIView animateKeyframesWithDuration:4.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewAnimationOptionCurveLinear
                              animations:keyFrameBlock
                              completion:^(BOOL finished) {
                                  // 动画完成后执行
                                  // code...
                              }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
