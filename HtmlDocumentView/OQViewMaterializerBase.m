//
//  HDViewFactoryBase.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQViewMaterializerBase.h"
#import "APElement.h"
#import "OQStyles.h"

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
    //this is the inner view, the background is set on the border frame, so this view needs to have a transparent background
    //REFACTOR THIS OUT OF THIS CLASS
    thisView.backgroundColor = [UIColor clearColor];
    
    thisView = [self createBorderFrameAroundView:thisView];
    
    //add the view to the element
    [element.HDVExtensions setObject:thisView forKey:@"view"];
    
    //build all child element and add as subview
    for(APElement* childElement in element.childElements)
    {        
        UIView* childView = [self buildViewForElement:childElement];
        [thisView addSubview:childView];
    }
    //and style the damn thing
    [materializer applyStylesToViewForElement:element];
    return thisView;

}

-(void)applyStylesToViewForElement:(APElement*)element;
{
    OQStyleBase *style = [element.HDVExtensions objectForKey:@"style"];
    if (style)
    {
        [style applyToElement:element];
    }
}

-(UIView*)createBorderFrameAroundView:(UIView*)view;
{
    UIView *borderFrameView = [[[UIView alloc]initWithFrame:view.frame]autorelease];
    [borderFrameView addSubview:view];

    return borderFrameView;
}
@end
