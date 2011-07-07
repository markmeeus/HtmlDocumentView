//
//  OQTableViewMaterializer.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 07/07/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQTableViewMaterializer.h"
#import "OQTableViewDataSource.h"

@implementation OQTableViewMaterializer
-(UIView*)createViewForElement:(APElement*)element;
{
    UITableView *tableView = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320,0) style:UITableViewStylePlain]autorelease];
    
    return tableView;    
}

//we need to process our own children, since they will not be added as subviews, but kept in a datasource
-(CGRect)processChildElementsOfElement:(APElement*)element forView:(UIView*)view;
{

    OQTableViewDataSource *dataSource = [[[OQTableViewDataSource alloc]init]autorelease];
    dataSource.sections = [NSMutableArray arrayWithObject:[NSMutableArray array]];
    
    //build all child elements and add as subview
    for(APElement* childElement in element.childElements)
    { 
        //first find a factory for this element
        OQViewMaterializerBase* materializer = [self getMaterializerForElement:(childElement)];
        if(!materializer)
            materializer = [[OQViewMaterializerBase alloc]init];
        
        UIView* childView = [materializer buildViewForElement:childElement atYPosition:0];
        
        // now that we have the childView , add it to the contentview of a cell
        UITableViewCell *cell = [[[UITableViewCell alloc]init]autorelease];        
        [cell.contentView addSubview:childView];
        
        if(childView.frame.size.height > 0)
            cell.contentView.frame = childView.frame;
        
        //default behaviour
        cell.textLabel.text = [childElement value] ;
        
        // and add the cell to the datasource
        [[dataSource.sections objectAtIndex:0] addObject:cell];
    }
    
    UITableView *table = [element.HDVExtensions objectForKey:@"innerView"];
    table.dataSource = dataSource;
    table.delegate = dataSource;

    //layout the table
    [table layoutIfNeeded];
    CGRect tableFrame = table.frame;
    tableFrame.size = table.contentSize;
    table.frame = tableFrame;
    return table.frame;
}
@end
