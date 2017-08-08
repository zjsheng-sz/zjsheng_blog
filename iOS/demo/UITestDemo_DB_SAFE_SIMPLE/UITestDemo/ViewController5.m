//
//  ViewController5.m
//  UITestDemo
//
//  Created by 毛志 on 14-8-11.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "ViewController5.h"
#import "UserModel.h"
#import "AppDelegate.h"
#import "CustomCell.h"

@interface ViewController5 ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    NSMutableArray * _dataArr;
}
@end

@implementation ViewController5
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _dataArr = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 背景色观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBG:) name:@"ColorChange" object:nil];
    
    /*
     1.注册为观察者
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBG:) name:@"通知名" object:nil];
     -(void)changeBG:(NSNotification *)note
     {
        获取object参数方法 [note object]
        获取userInfo参数方法 [note userInfo]
     }
     2.发送通知
     [[NSNotificationCenter defaultCenter] postNotificationName:@"通知名" object:@"传递的参数" userInfo:@{@"Value":@"一个参数不够用"}];
     3.移除观察者
     [[NSNotificationCenter defaultCenter] removeObserver:self name:@"通知名" object:nil];
     
     当某对象发送@"通知名" 只要是该通知名的观察者 都能触发changeBG:方法
     适用场合 ：1对多传参数
     
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-49-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
//    AppDelegate * dele = [UIApplication sharedApplication].delegate;
//    _dataArr = dele.userArr;
    
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellOne"];
    [_tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CellOne"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_dataArr removeAllObjects];
    DataBaseSimple * simple = [DataBaseSimple shareInstance];
    [_dataArr addObjectsFromArray:[simple selectFromUserTable]];
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellOne"];
    UserModel * m = _dataArr[indexPath.row];
    cell.name.text = m.name;
    cell.password.text = m .password;
    cell.gender.text = m.gender;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArr removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
        self.title = [NSString stringWithFormat:@"%d",_dataArr.count];
    }
}

- (void)changeBG:(NSNotification *)note
{
    NSLog(@"收到通知 修改颜色");
    self.view.backgroundColor = [note object];
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
