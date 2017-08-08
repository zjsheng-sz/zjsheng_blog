//
//  ViewController3.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    NSArray * arr = @[@"R",@"G",@"B"];
    self.navigationController.navigationBar.translucent = NO;
    for (int i = 0; i < 3; i++) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50+80*i, 80, 30)];
        label.text = arr[i];
        [self.view addSubview:label];
        
        UISlider * s = [[UISlider alloc] initWithFrame:CGRectMake(110, 50+80*i, 200, 30)];
        s.tag = 50+i;
        [s addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:s];
    }
    // 当前视图控制器接受摇一摇事件
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
}

- (void)valueChange:(UISlider *)s
{
    UISlider * s1 = (UISlider *)[self.view viewWithTag:50];
    UISlider * s2 = (UISlider *)[self.view viewWithTag:51];
    UISlider * s3 = (UISlider *)[self.view viewWithTag:52];
    self.view.backgroundColor = [UIColor colorWithRed:s1.value green:s2.value blue:s3.value alpha:1.0];
}

// 摇一摇
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    UIColor * color = self.view.backgroundColor;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ColorChange" object:color userInfo:@{@"Wahaha":@"Hello world!"}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
