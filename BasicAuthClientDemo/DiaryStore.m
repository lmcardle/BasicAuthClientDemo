//
//  DiaryStore.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DiaryStore.h"

#import "DiaryEntry.h"
#import "RestKit.h"

static RKObjectManager* diaryObjectManager;

@implementation DiaryStore
+(void)setupDiaryStore:(NSString*)userName password:(NSString*)password {
  RKClient* diaryClient = [RKClient clientWithBaseURLString:@"http://localhost:3000"];
  diaryClient.username = userName;
  diaryClient.password = password;
  
  diaryObjectManager = [[RKObjectManager alloc] init];
  diaryObjectManager.client = diaryClient;
  
  [self setupDiaryEntryMapping];
}

+(void)setupDiaryEntryMapping {
  RKObjectMapping* diaryEntryMapping = [RKObjectMapping mappingForClass:[DiaryEntry class]];
  [diaryEntryMapping mapKeyPath:@"title" toAttribute:@"title"];
  
  [diaryObjectManager.mappingProvider addObjectMapping:diaryEntryMapping];
}

+(NSArray*)diaryEntries {
  [diaryObjectManager loadObjectsAtResourcePath:@"/diary_entries.json" usingBlock:^(RKObjectLoader *loader) {
    loader.objectMapping = [diaryObjectManager.mappingProvider objectMappingForClass:[DiaryEntry class]];
    
    loader.onDidLoadObjects = ^(NSArray* objects) {
      NSLog(@"%@", objects);
    };
  }];

  return [NSArray new];
}
@end
