//
//  BaseViewFactory.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "BaseViewFactory.h"

@implementation BaseViewFactory

+(UIView*) viewFromElement:(APElement*) element;
{
    
    //get hold of the factory for this type of element
    NSString *className = [NSString stringWithFormat:@"%@ViewFactory", [element.name uppercaseString]];    
    Class class = NSClassFromString(className);
    
    //default to base implementation
    if(!class)
        class = [BaseViewFactory class];
    
    //Building the view
    UIView* view = [class createView:element];

    //add the view to the element
    [element.HDVExtensions setObject:view forKey:@"view"];
    //TODO: add style attributes here 

    
    //now create views for the child objects    for(APElement *childElement in [element childElements])
    for(APElement* childElement in element.childElements)
    {
        UIView *subView = [BaseViewFactory viewFromElement:childElement];
        [view addSubview:subView];
    }
     
    return  view;
}

+(UIView*)createView:(APElement*) element;
{
    return [[UIView alloc]init];
}
@end
