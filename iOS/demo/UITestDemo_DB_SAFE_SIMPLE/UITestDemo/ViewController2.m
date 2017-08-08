//
//  ViewController2.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UIScrollViewDelegate>

@end

@implementation ViewController2

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
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat height = (480-64-49) / 3.0;
    NSArray * arr = @[@"公鸡",@"青蛙",@"腿"];
    for (int i = 0; i < 3; i++) {
        UIScrollView * s = [[UIScrollView alloc] initWithFrame:CGRectMake(0, height*i, 320, height)];
        s.bounces = NO;
        s.showsHorizontalScrollIndicator = NO;
        s.pagingEnabled = YES;
        s.tag = 100 + i;
        s.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        if (i != 2) {
            s.delegate = self;
        }
        int count = i < 2 ? 10 : 40;
        s.contentSize = CGSizeMake(320*count, 0);
        
        for (int j = 0; j < count; j++) {
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(j*320, 0, 320, height)];
            label.font = [UIFont systemFontOfSize:25];
            label.textAlignment = NSTextAlignmentCenter;
            [s addSubview:label];
            label.text = [NSString stringWithFormat:@"%d 只 %@",j,arr[i]];
        }
        [self.view addSubview:s];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIScrollView * s1 = (UIScrollView *)[self.view viewWithTag:100];
    UIScrollView * s2 = (UIScrollView *)[self.view viewWithTag:101];
    UIScrollView * s3 = (UIScrollView *)[self.view viewWithTag:102];
    
    int count1 = s1.contentOffset.x / 320;
    int count2 = s2.contentOffset.x / 320;
    int count3 = 2*count1 + 4*count2;
    
    [UIView animateWithDuration:0.2 animations:^{
        s3.contentOffset = CGPointMake(320*count3, 0);
    }];
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
