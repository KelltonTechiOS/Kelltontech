//
//  AppDelegate.m
//  Kellton Tech
//
//  Created by Kellton Tech on 07/04/15.
//  Copyright (c) 2015 Kellton Tech. All rights reserved.
//

#import "AppDelegate.h"
#import "EventsAndCelebrations.h"
#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
@interface AppDelegate ()
{
    NSArray *eventArray;
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
  /*  NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSString *imagesPath=[DocumentsDirectory stringByAppendingPathComponent:@"hey"];

     [fileManager createDirectoryAtPath:imagesPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSData* data = UIImagePNGRepresentation([UIImage imageNamed:@"upload.png"]);
    [data writeToFile:imagesPath atomically:YES];
    
    */

    [self addingImages:@"Events"  occassionName:@"FIFA July 2015" occassionNameImages:[NSArray arrayWithObjects:@"FIFA July 2015.png",@"FIFA2.png", nil]];
    
    [self addingImages:@"Events"  occassionName:@"Nasscom 2014" occassionNameImages:[NSArray arrayWithObjects:@"Nasscom 2014.png",@"All Hands2.png", nil]];
    
    [self addingImages:@"Events"  occassionName:@"Charity 2013" occassionNameImages:[NSArray arrayWithObjects:@"Charity 2013.png", @"Charity2.png", nil]];
    
    
    [self addingImages:@"Celebrations"  occassionName:@"Christmas 2013" occassionNameImages:[NSArray arrayWithObjects:@"Christmas 2013.png",@"Christmas2.png", nil]];
    
    
    [self addingImages:@"Celebrations"  occassionName:@"Diwali Celebrations 2014" occassionNameImages:[NSArray arrayWithObjects:@"Diwali Celebrations 2014.png", @"Diwali2.png", nil]];
    
    
    [self addingImages:@"Celebrations"  occassionName:@"Independence Day Celebrations 2015" occassionNameImages:[NSArray arrayWithObjects:@"Independence Day Celebrations 2015.png",@"Independence Day2.png", nil]];
    
    return YES;
}

-(void)addingImages:(NSString*)occasionFolder occassionName:(NSString*)occassionName occassionNameImages:(NSArray *)occassionNameImages
{
    NSString *imagesPath=[DocumentsDirectory stringByAppendingPathComponent:@"images"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSLog(@"%@-- %@-",occasionFolder,occassionName);
    if (![fileManager fileExistsAtPath:imagesPath])
    {
        [fileManager createDirectoryAtPath:imagesPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    
        
        if (![fileManager fileExistsAtPath:[imagesPath stringByAppendingPathComponent:occasionFolder]])
        {
            
         
            [fileManager createDirectoryAtPath:[imagesPath stringByAppendingPathComponent:occasionFolder] withIntermediateDirectories:YES attributes:nil error:nil];
            
            }

            if (![fileManager fileExistsAtPath:[[imagesPath stringByAppendingPathComponent:occasionFolder] stringByAppendingPathComponent:occassionName]])
            {
                [fileManager createDirectoryAtPath:[[imagesPath stringByAppendingPathComponent:occasionFolder] stringByAppendingPathComponent:occassionName] withIntermediateDirectories:YES attributes:nil error:nil];
            }
        for(int j=0;j<[occassionNameImages count];j++)
        {
            NSString *filePath=[[imagesPath stringByAppendingPathComponent:occasionFolder]stringByAppendingPathComponent:occassionName] ;
            
            
            NSData * dataImage = UIImagePNGRepresentation([UIImage imageNamed:[occassionNameImages objectAtIndex:j]]);
            
            [dataImage writeToFile: [filePath stringByAppendingPathComponent:[occassionNameImages objectAtIndex:j]] atomically:YES];
            
        }
   }

-(void)addDataToDatabase {
    [[NSUserDefaults standardUserDefaults] setObject:@"admin" forKey:@"emailID"];
    [[NSUserDefaults standardUserDefaults] setObject:@"password" forKey:@"password"];
    
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"FIFA",@"All Hands",@"Charity", nil] forKeys:[NSArray arrayWithObjects:@"2014",@"2014",@"2013", nil]];
//    
//    NSArray *arrayOfImages = [NSArray arrayWithObjects:@"FIFA July 2014",@"All Hands March 2014",@"Charity 2013", nil];
//    
//    EventsAndCelebrations *details;
//
//    for (NSString *key in [dict allKeys]) {
//        details = [NSEntityDescription insertNewObjectForEntityForName:@"EventsAndCelebrations"
//                                                inManagedObjectContext:[self managedObjectContext]];
//        details.name = [dict valueForKey:key];
//        details.year = [NSNumber numberWithInt:(int)key.integerValue];
//        details.type = @"Events";
//        
//        UIImage *sampleimage = [UIImage imageNamed:[arrayOfImages objectAtIndex:]];
//        
//        NSData *dataImage = UIImageJPEGRepresentation(sampleimage, 0.0);
//        
//        [self saveContext];
//    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "kelltontech.com.Kellton_Tech" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Kellton_Tech" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Kellton_Tech.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
