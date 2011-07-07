//
//  OQTableViewDataSource.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 07/07/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQTableViewDataSource.h"


@implementation OQTableViewDataSource
@synthesize sections;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [self getCellForIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [self getCellForIndexPath:indexPath].contentView.frame.size.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return [self.sections count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [(NSArray*)[self.sections objectAtIndex:section] count];
}

-(UITableViewCell*)getCellForIndexPath:(NSIndexPath *)indexPath;
{
    return [(NSArray*)[self.sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];    
}
@end
