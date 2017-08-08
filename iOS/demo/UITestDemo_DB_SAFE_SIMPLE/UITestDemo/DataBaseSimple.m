//
//  DataBaseSimple.m
//  UITestDemo
//
//  Created by sword on 14-8-15.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import "DataBaseSimple.h"
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface DataBaseSimple ()

@property(nonatomic, strong) FMDatabaseQueue *dbQueue;
@property(nonatomic, strong) NSString *path;

@end

@implementation DataBaseSimple

+(DataBaseSimple *)shareInstance
{
    static DataBaseSimple * simple = nil;
    
    if (simple == nil) {
        simple = [[DataBaseSimple alloc] init];
    }
    
    return simple;
}


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:self.path];
        
        [_dbQueue inDatabase:^(FMDatabase *db) {
            if (![db executeUpdate:@"create table if not exists User (Number integer primary key autoincrement,Name text,Password text,Gender text)"]) {
                NSLog(@"create table error!");
                return;
            }
        }];
        
        [self upateDatabase];
        
    }
    return self;
}

//增加字段,升级数据库
- (void)upateDatabase{

    [_dbQueue inDatabase:^(FMDatabase *db) {
        
        if (![db columnExists:@"User" columnName:@"age"]) {
            
            if (![db executeUpdate:@"alter table User add column age text"]) {
                NSLog(@"alter error");
            }
        }
        
    }];
}


#pragma setter and getter
- (NSString *)path{
    
    if (!_path) {
        // 数据库创建 表格创建
        _path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/User.db"];
        NSLog(@"path is %@",_path);
    }
    
    return _path;
}

//插入表格
-(void)insertIntoUserTable:(UserModel *)model
{

    [_dbQueue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:@"insert into User (Number,Name,Password,Gender,age) values (?,?,?,?,?)",[NSNumber numberWithInt:model.number],model.name,model.password,model.gender,@"30"]) {
            NSLog(@"insert db error!");
        }
    }];
    
}

//根据num删除
-(void)deleteFromUserTableWithNumber:(int)num
{
    [_dbQueue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:@"delete from User where Number=?",[NSNumber numberWithInt:num]]) {
            NSLog(@"delete data error!");
        }
    }];
}


//清空表格
-(void)deleteUserTable
{
    [_dbQueue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:@"delete from User"]) {
            NSLog(@"delete User error!");
        }
    }];
}


//修改
-(void)updateFromUserTableWithNumber:(int)num withModifyModel:(UserModel *)model{
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:@"update User set Name=?,Password=?,Gender=? where Number=?",model.name,model.password,model.gender,[NSNumber numberWithInt:model.number]]) {
            NSLog(@"update error!");
        }
    }];
}


//查找某一行
-(UserModel *)selectFromUserTableWithNumber:(int)num{
    
    __block UserModel * model = [[UserModel alloc] init];
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * set = [db executeQuery:@"select * from User where Number=?",[NSNumber numberWithInt:num]];
        [set next];
        model.number = [set intForColumn:@"Number"];
        model.name = [set stringForColumn:@"Name"];
        model.password = [set stringForColumn:@"Password"];
        model.gender = [set stringForColumn:@"Gender"];
    }];
    return model;
}

//查找所有
-(NSMutableArray *)selectFromUserTable
{
    __block NSMutableArray * arr = [NSMutableArray array];
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet * set = [db executeQuery:@"select * from User"];
        while ([set next]) {
            UserModel * model = [[UserModel alloc] init];
            model.number = [set intForColumn:@"Number"];
            model.name = [set stringForColumn:@"Name"];
            model.password = [set stringForColumn:@"Password"];
            model.gender = [set stringForColumn:@"Gender"];
            [arr addObject:model];
        }
    }];
    return arr;
}



#if 1
//银行转账，安全模式
- (void) dbTransaction
{

    // User (ID,Name,Money)
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL flag = YES;
        flag &= [db executeUpdate:@"update User set Money=Money-50 where Name=?",@"zhangsan"];
        flag &= [db executeUpdate:@"update User set Money=Money+50 where Name=?",@"lisi"];
        if (flag) {
            // 两个操作同时成功
            NSLog(@"转账成功");
        }else{
            // 两个操作同时失败 回滚
            *rollback = YES;
            NSLog(@"转账失败，资金已经退回银行账号");
        }
    }];

#if 0
    FMDatabase * dataBase = nil;
    [dataBase beginTransaction];
    BOOL flag = YES;
    flag &= [dataBase executeUpdate:@"update User set Money=Money-50 where Name=?",@"zhangsan"];
    flag &= [dataBase executeUpdate:@"update User set Money=Money+50 where Name=?",@"lisi"];
    if (flag) {
        // 两个操作同时成功
        NSLog(@"转账成功");
        // 真正的提交
        [dataBase commit];
    }else{
        // 两个操作同时失败 回滚
        NSLog(@"转账失败，资金已经退回银行账号");
        // 回滚
        [dataBase rollback];
    }
#endif
    FMDatabase *dataBase = nil;
    [dataBase beginTransaction];
    BOOL flag = YES;
    flag &= [dataBase executeUpdate:@"update User set Money=Money-50 where Name=?",@"zhangsan"];
    flag &= [dataBase executeUpdate:@"update User set Money=Money+50 where Name=?",@"lisi"];
    if (flag) {
        NSLog(@"转账成功");
        [dataBase commit];
    }else{
        NSLog(@"转账失败");
        [dataBase rollback];
    }

}
#endif


- (void)upgradeDB {
    
    
    
    __block BOOL isRollBack = NO;
    
    [[FMDatabaseQueue databaseQueueWithPath:@""] inDatabase:^(FMDatabase *db) {
        
        [db beginTransaction];
        
        @try {
            
            [db executeUpdate:@"CREATE TEMPORARY TABLE comicRead_backup(comicId INTEGER, chapterId INTEGER, pageIndex INTEGER, updateTime INTEGER)"];
            
            [db executeUpdate:@"INSERT INTO comicRead_backup SELECT comicId,chapterId,pageIndex,updateTime FROM comicRead"];
            
            [db executeUpdate:@"DROP TABLE comicRead"];
            
            //浏览记录,却掉之前的comicId的unique约束
            
            NSString *comicReaderSql = @"CREATE TABLE IF NOT EXISTS comicRead (\
            comicId  INTEGER DEFAULT 0,\
            chapterId  INTEGER DEFAULT 0,\
            pageIndex  INTEGER DEFAULT 0,\
            updateTime  INTEGER DEFAULT 0)";
            [db executeUpdate:comicReaderSql];
            [db executeUpdate:@"INSERT INTO comicRead SELECT comicId,chapterId,pageIndex,updateTime FROM comicRead_backup"];
            
            [db executeUpdate:@"DROP TABLE comicRead_backup"];
            
            [db executeUpdate:@"ALTER TABLE comicRead ADD COLUMN cover TEXT"];
            
            [db executeUpdate:@"ALTER TABLE comicRead ADD COLUMN comic_name TEXT"];
            
            [db executeUpdate:@"ALTER TABLE comicRead ADD COLUMN chapter_name TEXT"];
            
            [db executeUpdate:@"ALTER TABLE comicRead ADD COLUMN isLocal INTEGER default 0"];
            
            
            
//            [db executeStatements:@"CREATE UNIQUE INDEX IF NOT EXISTS comicReadUniqueIndex ON comicRead(comicId,isLocal)"];
            
            [db executeUpdate:@"UPDATE comicRead SET isLocal=1"];
            
        }
        
        @catch (NSException *exception) {
            
            isRollBack = YES;
            
            [db rollback];
            
        }
        
        @finally {
            
            if (!isRollBack) {
                
                [db commit];
                
//                [UserDefaults setInteger:2 forKey:VersionKey];
                
//                [UserDefaults synchronize];
                

//                debugLog(@"upgradeTo_2 success");
                
                
                
                [self upgradeDB];
                
            }
            
        }
        
    }];
    
}




@end
