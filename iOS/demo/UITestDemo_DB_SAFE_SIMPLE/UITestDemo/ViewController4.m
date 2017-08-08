//
//  ViewController4.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "ViewController4.h"
#import "AppDelegate.h"
#import "UserModel.h"

@interface ViewController4 ()
{
    
    __weak IBOutlet UITextField *_userName;
    
    __weak IBOutlet UITextField *_password;
    
    __weak IBOutlet UITextField *_gender;
}

@end

@implementation ViewController4

int count = 0;
- (IBAction)saveClick:(id)sender {
    
    UserModel * m = [[UserModel alloc] init];
    m.number = arc4random();
    m.name = _userName.text;
    m.password = _password.text;
    m.gender = _gender.text;
    
    DataBaseSimple * simple = [DataBaseSimple shareInstance];
    [simple insertIntoUserTable:m];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 键盘掉下
    [self.view endEditing:YES];
}

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
