//
//  DiaryStore.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DiaryStore.h"

#import "DiaryEntry.h"

@implementation DiaryStore
+(void)setupDiaryStore:(NSString*)userName password:(NSString*)password {
  
}

+(NSArray*)diaryEntries {
  DiaryEntry* de = [DiaryEntry new];
  de.title = @"title";
  
  return [NSArray arrayWithObject:de];
}
@end
