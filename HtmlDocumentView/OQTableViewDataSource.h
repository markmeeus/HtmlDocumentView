//
//  OQTableViewDataSource.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 07/07/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OQTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate> {
    
}
@property (nonatomic, retain) NSArray* sections;

-(UITableViewCell*)getCellForIndexPath:(NSIndexPath *)indexPath;
@end
