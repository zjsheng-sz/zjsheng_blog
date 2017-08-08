//
//  ViewController.m
//  BasicOC
//
//  Created by robert on 2017/1/4.
//  Copyright © 2017年 ZJS. All rights reserved.
//

#import "ViewController.h"
#import "basicOC-swift.h"

typedef struct {
    int i;
    float f;
} MyIntegerFloatStruct;



@interface ViewController ()

@property(nonatomic, strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createAvalue];
    
}

- (void)textKit{
    
    [self.textView.textStorage beginEditing];
//    [self markWord:@"Alice" inTextStorage:self.textView.textStorage];
    [self.textView.textStorage endEditing];
    
}
    
- (void)createAvalue{
    
    MyIntegerFloatStruct aStruct;
    
    aStruct.i = 42;
    
    aStruct.f = 3.14;
    
    NSValue *structValue = [NSValue value:&aStruct
                             withObjCType:@encode(MyIntegerFloatStruct)];
    
    NSLog(@"structValue = %@",structValue);
    
    MyIntegerFloatStruct anotherStuct;
    [structValue getValue:&anotherStuct];
    
    int i = anotherStuct.i;
    int j = anotherStuct.f;
    
    NSLog(@"i = %d, j = %d",i,j);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
