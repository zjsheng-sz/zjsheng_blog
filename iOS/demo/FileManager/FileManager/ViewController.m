//
//  ViewController.m
//  FileManager
//
//  Created by robert on 2016/12/25.
//  Copyright © 2016年 ZJS. All rights reserved.
//

#import "ViewController.h"

const NSInteger READ_LENGTH = 1024; // 1M

@interface ViewController ()
@property(nonatomic, strong)NSString *homePath;//沙盒主目录
@property(nonatomic, strong)NSString *documentPath;//Documents 会被itunes备份
//Library  除了Cache目录不会被备份，其他目录会备份；NSUserDefault数据存储在preference目录中
@property(nonatomic, strong)NSString *libraryPath;
@property(nonatomic, strong)NSString *tmpPath;//tmp
@property(nonatomic, strong)NSString *cachesPath;//Library/Caches

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path;
    
    path = self.homePath;
    path = self.documentPath;
    path = self.libraryPath;
    path = self.tmpPath;
    path = self.cachesPath;
    
    [self fileTest];
}

- (void)fileTest{
    
    //从项目中获得图片文件, 写入到沙盒, 再从沙盒中取出显示
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"jpg"];
//    NSData *imageData = [self fileHandleReadFromFilePath:path];
//    NSString *imageFilePath = [self.documentPath stringByAppendingPathComponent:@"dog.jpg"];
//    [self createFileWithPath:imageFilePath];
//    [imageData writeToFile:imageFilePath atomically:YES];
//    
//    UIImage *image = [UIImage imageWithContentsOfFile:imageFilePath];
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//    imgView.frame = CGRectMake(0, 0, image.size.width/3.0, image.size.height/3.0);
//    [self.view addSubview:imgView];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 常见目录
- (NSString *)homePath{
    
    if (!_homePath) {
        _homePath = NSHomeDirectory();
    }
    NSLog(@"path:%@",_homePath);
    return _homePath;
    
}

- (NSString *)documentPath{
    
    if (!_documentPath) {
        _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
    }
    NSLog(@"path:%@",_documentPath);
    return _documentPath;
}

- (NSString *)tmpPath{
    
    if (!_tmpPath) {
        _tmpPath = NSTemporaryDirectory();
    }
    NSLog(@"path:%@",_tmpPath);
    return _tmpPath;
}

- (NSString *)cachesPath{
    
    if (!_cachesPath) {
        _cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    }
    NSLog(@"path:%@",_cachesPath);
    return _cachesPath;
}

- (NSString *)libraryPath{
    
    if (!_libraryPath) {
        _libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    }
    NSLog(@"path:%@",_libraryPath);
    return _libraryPath;
}

#pragma mark - fileManager 操作

//创建文件夹
- (BOOL)createDirectoryWithPath:(NSString *)directoryPath{
    
    BOOL isDirectory;
    BOOL isExistDirPath = [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (isExistDirPath && isDirectory) {//存在文件夹
        NSLog(@"存在文件夹，不用创建");
        return NO;
    }
    
    BOOL isCreateDir = [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    if (isCreateDir) {
        NSLog(@"文件夹创建成功");
        return YES;
        
    }else{
        NSLog(@"文件夹创建失败");
        
        return NO;
    }
    
}

//创建文件
- (BOOL)createFileWithPath:(NSString *)filePath{
    
    BOOL isDirectory;
    BOOL isExistFilePath = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    if (isExistFilePath && !isDirectory) {//存在文件
        NSLog(@"存在文件，不用创建");
        return NO;
    }
    
    BOOL isCreateDir = [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    
    if (isCreateDir) {
        NSLog(@"文件创建成功");
        return YES;
        
    }else{
        NSLog(@"文件创建失败");
        
        return NO;
    }
}

//删除文件夹
- (BOOL)deleItemWithPath:(NSString *)path{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        BOOL result = [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        
        if (result) {
            return YES;
        }else{
            return NO;
        }
    }
    
    return NO;
}

#pragma mark - 基本数据类型操作
//string, array, dictionary, data 直接写入文件
-(BOOL)writeFileWithFilePath:(NSString *)filePath Content:(NSString *)content{
    
    //字典，数组，字符串一样
    BOOL res=[content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        NSLog(@"文件写入成功");
        return YES;
    }else{
        NSLog(@"文件写入失败");
        return NO;
    }
}

//读文件
-(NSString *)readWithFilePath:(NSString *)filePath {
    
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return content;
}

//获取属性
- (void)getAttributeWithPath:(NSString *)path{
    
    NSDictionary * attributeDic = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    NSLog(@"attributeDic = %@",attributeDic);
}

#pragma mark - fileHandle 操作

- (void)fileHandleWriteToFilePath:(NSString *)filePath{
    
    NSFileHandle *writehandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    [writehandle seekToEndOfFile];
    
    NSString *appendingString = @"精彩纷呈的世界";
    for (int i = 0; i < 10 ; i ++) {
        [writehandle writeData:[appendingString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [writehandle closeFile];
    
}


- (NSData *)fileHandleReadFromFilePath:(NSString *)filePath{
    
    NSMutableData *mData = [[NSMutableData alloc] init];
    
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    
    NSDictionary * fileAttribute = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    
    CGFloat fileSize = [[fileAttribute objectForKey:NSFileSize] floatValue];
    
    CGFloat readLength = 0.0;
    
    while (readLength < fileSize) {
        
        NSData *data = [readHandle readDataOfLength:READ_LENGTH];
        //send
        
        [mData appendData:data];
        
        readLength += READ_LENGTH;
    }
    
    return mData;
}


@end
