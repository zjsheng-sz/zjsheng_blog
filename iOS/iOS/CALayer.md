
## CALayer

[CALayer自定义](http://www.cnblogs.com/wendingding/p/3800961.html)


1. 在方法： drawInContext:(CGContextRef)ctx）中用CoreGraphic绘制
   setNeedsDisplay 调用drawInContext方法

2. 设置CALayer的delegate，然后让delegate实现drawLayer:inContext:方法，当CALayer需要绘图时，会调用delegate的drawLayer:inContext:方法进行绘图
```objc
//
//  YYViewController.m
//  06-自定义layer(2)
//
//  Created by apple on 14-6-21.
//  Copyright (c) 2014年 itcase. All rights reserved.

#import "YYViewController.h"
@interface YYViewController ()
@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.创建自定义的layer
    CALayer *layer=[CALayer layer];
    //2.设置layer的属性
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.position=CGPointMake(100, 100);
    layer.cornerRadius=20;
    layer.shadowColor=[UIColor blackColor].CGColor;
    layer.shadowOffset=CGSizeMake(10, 20);
    layer.shadowOpacity=0.6;

    //设置代理
    layer.delegate=self;
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    //    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);

    //2.渲染
    CGContextFillPath(ctx);
}
@end
```
