//
//  Wishes+CoreDataProperties.h
//  JSSafeCoreData
//
//  Created by robert on 2017/1/5.
//  Copyright © 2017年 zjs. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Wishes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Wishes (CoreDataProperties)

+ (NSFetchRequest<Wishes *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *identifer;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
