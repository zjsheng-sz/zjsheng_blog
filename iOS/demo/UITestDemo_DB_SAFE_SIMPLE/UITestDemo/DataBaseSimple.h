//
//  DataBaseSimple.h
//  UITestDemo
//
//  Created by sword on 14-8-15.
//  Copyright (c) 2014年 maozhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface DataBaseSimple : NSObject

+(DataBaseSimple *)shareInstance;


//User表
-(void)insertIntoUserTable:(UserModel *)model;
-(void)deleteFromUserTableWithNumber:(int)num;
-(void)deleteUserTable;
-(void)updateFromUserTableWithNumber:(int)num withModifyModel:(UserModel *)model;
-(UserModel *)selectFromUserTableWithNumber:(int)num;
-(NSMutableArray *)selectFromUserTable;


@end
