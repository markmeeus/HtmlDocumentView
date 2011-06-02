//
//  HDViewFactoryBase.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQViewMaterializerBase.h"
#import "APElement.h"

@implementation OQViewMaterializerBase
@synthesize document;

#pragma mark overridables
-(UIView*)createViewForElement:(APElement*)element;
{
    return [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)]autorelease];
}

-(OQViewMaterializerBase*)getMaterializerForElement:(APElement*)element;
{
    return [element.HDVExtensions objectForKey:@"materializer"];
}

-(UIView*)buildViewForElement:(APElement*)element;
{
    //first find a factory for this element
    OQViewMaterializerBase* materializer = [self getMaterializerForElement:(element)];
    if(!materializer)
        materializer = [[[OQViewMaterializerBase alloc]init] autorelease];
    
    //create view for this element
    UIView* thisView = [materializer createViewForElement:element];
    thisView = [self createBorderFrameAroundView:thisView];
    
    //add the view to the element
    [element.HDVExtensions setObject:thisView forKey:@"view"];
    
    //build all child element and add as subview
    for(APElement* childElement in element.childElements)
    {        
        UIView* childView = [self buildViewForElement:childElement];
        [thisView addSubview:childView];
    }
    return thisView;

}

-(UIView*)createBorderFrameAroundView:(UIView*)view;
{
    UIView *borderFrameView = [[[UIView alloc]initWithFrame:view.frame]autorelease];
    [borderFrameView addSubview:view];

    return borderFrameView;
}
@end
