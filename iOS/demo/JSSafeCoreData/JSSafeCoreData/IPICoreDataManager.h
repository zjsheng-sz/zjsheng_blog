//
//  IPICoreDataManager.h
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Wishes+CoreDataProperties.h"
#import "Users+CoreDataProperties.h"


@interface IPICoreDataManager : NSObject

+(instancetype)shareDBManager;

/*
 User表的操作
 */
    
//增
- (void)createUserWithIdentifer:(NSString *)identifer name:(NSString *)name;
    
//删
- (BOOL)deleteUserByIdentifer:(NSString *)identifer;

//查
-(NSArray<Users *> *)fetchUserByPredicate:(NSPredicate *)predicate;
    
@end
