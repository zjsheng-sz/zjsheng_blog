//
//  ViewController1.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UIActionSheetDelegate>

@end

@implementation ViewController1

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(click)];
    self.title = [NSString stringWithFormat:@"第%d层",(int)self.navigationController.viewControllers.count];
    
    // 背景色观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBG:) name:@"ColorChange" object:nil];
}


- (void)changeBG:(NSNotification *)note
{
    NSLog(@"收到通知 修改颜色");
    self.view.backgroundColor = [note object];
//    [note userInfo];
    NSLog(@">>>%@ %@",[note object],[note userInfo]);
}

- (void)click
{
//    UIAlertView
    UIActionSheet * sheetView = [[UIActionSheet alloc] initWithTitle:@"提醒" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"回到上一层" otherButtonTitles:@"回到最顶层",@"回到第3层",@"进入第5层",@"进入下一层",nil];
    [sheetView showInView:self.view];
    
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"index %d click...",(int)buttonIndex);
    switch (buttonIndex) {
        case 0:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        case 2:
        {
            if (self.navigationController.viewControllers.count > 3) {
                UIViewController * ctl = self.navigationController.viewControllers[2];
                [self.navigationController popToViewController:ctl animated:YES];
            }
        }
            break;
        case 3:
        {
            if (self.navigationController.viewControllers.count < 5) {
                int count = 5 - (int)self.navigationController.viewControllers.count;
                for (int i = 0; i < count; i++) {
                    ViewController1 * ctl1 = [[ViewController1 alloc] init];
                    [self.navigationController pushViewController:ctl1 animated:NO];
                }
            }
        }
            break;
        default:
        {
            ViewController1 * ctl = [[ViewController1 alloc] init];
            [self.navigationController pushViewController:ctl animated:YES];
        }
            break;
    }
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
