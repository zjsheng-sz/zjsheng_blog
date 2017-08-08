//
//  IPICoreDataManager.m
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "IPICoreDataManager.h"

@interface IPICoreDataManager ()

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong) NSManagedObjectModel *managedObjectModel;
    

@end

@implementation IPICoreDataManager


+(instancetype)shareDBManager{
    
    static IPICoreDataManager *_dbManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dbManager = [[IPICoreDataManager alloc] init];
    });
    
    return _dbManager;
}
    
#pragma mark - Initializing the Core Data Stack
    
- (NSManagedObjectModel *)managedObjectModel{

    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"JSSafeCoreData" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    return mom;
}
    
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{

    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];

    NSError *error = nil;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self dbPath] options:nil error:&error];
    NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    
    return psc;
}
    
- (NSManagedObjectContext *)managedObjectContext{

    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    return nil;
}
    
    
- (NSURL *)dbPath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
//    NSMutableString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] mutableCopy];
//    [path stringByAppendingPathComponent:@"JSSafeCoreData.sqlite"];
//    return [NSURL URLWithString:path];
    return storeURL;
}
    
- (void)saveContext {

    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        
        NSError *error;
        BOOL result = [self.managedObjectContext save:&error];
        
        NSAssert(result, error.localizedDescription);
        
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - Wishes

- (void)createUserWithIdentifer:(NSString *)identifer name:(NSString *)name{
    
    Users *aUser = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:self.managedObjectContext];
    aUser.identifer = identifer;
    aUser.name = name;
    
    [self saveContext];
}

    
-(NSArray<Users *> *)fetchUserByPredicate:(NSPredicate *)predicate{
    
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [Users fetchRequest];
    if (predicate) {
        fetchRequest.predicate = predicate;
    }
    NSArray *result = [self.managedObjectContext executeFetchRequest:[Users fetchRequest] error:&error];
    
    if (!result) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    return result;
}

    
@end
