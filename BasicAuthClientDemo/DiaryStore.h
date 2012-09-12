//
//  DiaryStore.h
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DiaryEntry;

@interface DiaryStore : NSObject
+(void)setupDiaryStore:(NSString*)userName password:(NSString*)password;

+(NSArray*)diaryEntries;
+(void)saveDiaryEntry:(DiaryEntry*)diaryEntry;
@end
