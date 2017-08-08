//
//  webview.m
//  JSCoreDemo
//
//  Created by ipi on 2017/1/11.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "webview.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation webview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];

    if( self ){

        self.webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 310, self.bounds.size.width, 300)];
        self.webview.backgroundColor=[UIColor lightGrayColor];
        NSString *htmlPath=[[NSBundle mainBundle] resourcePath];
        htmlPath=[htmlPath stringByAppendingPathComponent:@"html/index.html"];
        NSURL *localURL=[[NSURL alloc]initFileURLWithPath:htmlPath];
        [self.webview loadRequest:[NSURLRequest requestWithURL:localURL]];
        [self addSubview:self.webview];


        JSContext *context = [self.webview valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        context[@"jakilllog"] = ^() {

            NSLog(@"+++++++Begin Log+++++++");
            NSArray *args = [JSContext currentArguments];

            for (JSValue *jsVal in args) {
                NSLog(@"%@", jsVal);
            }

            JSValue *this = [JSContext currentThis];
            NSLog(@"this: %@",this);
            NSLog(@"-------End Log-------");

        };


    }
    return self;
}

@end
