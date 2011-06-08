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
    //create view for this element
    UIView* thisView = [self createViewForElement:element];

    //add the inner view to the element
    [element.HDVExtensions setObject:thisView forKey:@"innerView"];
    
    //create the border/background frame
    thisView = [self createBorderFrameAroundView:thisView];
    
    //add the view to the element
    [element.HDVExtensions setObject:thisView forKey:@"view"];
    
    //build all child elements and add as subview
    for(APElement* childElement in element.childElements)
    { 
        //first find a factory for this element
        OQViewMaterializerBase* materializer = [self getMaterializerForElement:(childElement)];
        if(!materializer)
            materializer = [[OQViewMaterializerBase alloc]init];
        
        UIView* childView = [materializer buildViewForElement:childElement];
        [materializer addSubView:childView ToElement:element];
    }
    
    //and style the damn thing
    [self applyStylesToViewForElement:element];
    return thisView;

}
-(void)addSubView:(UIView*)subView ToElement:(APElement*)element;
{
    UIView* view = [element.HDVExtensions objectForKey:@"view"];
    [view addSubview:subView];
}

-(void)applyStylesToViewForElement:(APElement*)element;
{
    NSArray *styles = [element.HDVExtensions objectForKey:@"styles"];
    if(styles==nil)
        return;//no styles, bail out
    
    for(OQStyleBase *style in styles)
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
