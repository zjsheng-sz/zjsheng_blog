
- https://www.jianshu.com/p/66e15b4bb8d6
- https://www.cnblogs.com/bomo/p/4693076.html?utm_source=tuicool

FMDB官方库地址：https://github.com/ccgus/fmdb
SQLCipher官网：https://www.zetetic.net/sqlcipher/


### 集成 SQLCipher

      pod 'FMDB/SQLCipher'


### 加密方法的使用


    + (instancetype)databaseQueueWithPath:(NSString*)aPath

    中调用一次 ,例如：

    self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath]

    [self.dbQueue inDatabase:^(FMDatabase*db) {

        [db setKey:kDBEncryptedKey]

    }];

    //这里有个坑：不是每次调用

    - (void)inDatabase:(void(^)(FMDatabase*db))block

    的时候都要在block里调用

    - (BOOL)setKey:(NSString*)key

    只需要在初始化FMDatabaseQueue完的时候调用一次即可，而且要保证最先调用，不然任何数据库操作都是非法的！
