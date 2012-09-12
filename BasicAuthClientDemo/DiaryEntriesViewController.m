//
//  DiaryEntriesViewController.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DiaryEntriesViewController.h"

#import "DiaryEntry.h"
#import "DiaryStore.h"

@interface DiaryEntriesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong) NSArray* diaryEntries;
@property (weak, nonatomic) IBOutlet UITableView *diaryEntriesTable;
@end

@implementation DiaryEntriesViewController

-(void)viewDidLoad {
  [super viewDidLoad];
  
  self.diaryEntries = [DiaryStore diaryEntries];
  
  self.diaryEntriesTable.dataSource = self;
  self.diaryEntriesTable.delegate = self;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.diaryEntries.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DiaryCell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DiaryCell"];
  }

  DiaryEntry* de = [self.diaryEntries objectAtIndex:indexPath.row];
  cell.textLabel.text = de.title;
  
  return cell;
}

@end
