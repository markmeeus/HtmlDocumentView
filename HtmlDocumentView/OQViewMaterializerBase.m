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

-(UIView*)buildViewForElement:(APElement*)element atYPosition:(int)YPosition;
{
    //create view for this element
    UIView* innerView = [self createViewForElement:element];

    //add the inner view to the element
    [element.HDVExtensions setObject:innerView forKey:@"innerView"];
    
    //create the border/background frame
    UIView* thisView  = [self createBorderFrameAroundView:innerView];
    
    //add the view to the element
    [element.HDVExtensions setObject:thisView forKey:@"view"];

    
    CGRect childContainerFrame = [self processChildElementsOfElement:element forView:thisView];;
    
    //set the position of this view
    innerView.frame = childContainerFrame;
    CGRect thisFrame = childContainerFrame;
    thisFrame.origin.y = YPosition;
    thisView.frame = thisFrame;
    
    
    [self applyStylesToViewForElement:element];

    return thisView;

}

-(CGRect)processChildElementsOfElement:(APElement*)element forView:(UIView*)view;
{
    CGRect childContainerFrame = view.frame;
    int currentYPosition = 0;
    //build all child elements and add as subview
    for(APElement* childElement in element.childElements)
    { 
        //first find a factory for this element
        OQViewMaterializerBase* materializer = [self getMaterializerForElement:(childElement)];
        if(!materializer)
            materializer = [[OQViewMaterializerBase alloc]init];
        
        UIView* childView = [materializer buildViewForElement:childElement atYPosition:currentYPosition];
        [materializer addSubView:childView ToElement:element];
        childContainerFrame.size.width = MAX(childContainerFrame.size.width, childView.frame.size.width);
        childContainerFrame.size.height = childContainerFrame.size.height + childView.frame.size.height;
        currentYPosition = childContainerFrame.size.height;
        
    }
    return childContainerFrame;
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
