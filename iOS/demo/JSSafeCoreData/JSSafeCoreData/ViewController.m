//
//  ViewController.m
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "ViewController.h"
#import "IPICoreDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[IPICoreDataManager shareDBManager] createUserWithIdentifer:@"1" name:@"zhongJiaSheng"];
    [[IPICoreDataManager shareDBManager] createUserWithIdentifer:@"2" name:@"luheqi"];
    [[IPICoreDataManager shareDBManager] createUserWithIdentifer:@"3" name:@"liulianxi"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
