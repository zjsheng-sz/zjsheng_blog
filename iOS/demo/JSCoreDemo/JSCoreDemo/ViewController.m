//
//  ViewController.m
//  JSCoreDemo
//
//  Created by ipi on 2017/1/11.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "ViewController.h"
#import "webview.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        webview *webVeiw = [[webview alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:webVeiw];
        
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
