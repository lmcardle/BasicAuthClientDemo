//
//  AppDelegate.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"

#import "DiaryEntry.h"
#import "DiaryStore.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  [DiaryStore setupDiaryStore:@"test@test.com" password:@"password"];
    
  DiaryEntry* de = [DiaryEntry new];
  de.title = @"My post from iOS!";
  
  [DiaryStore saveDiaryEntry:de];
//  [DiaryStore diaryEntries];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
