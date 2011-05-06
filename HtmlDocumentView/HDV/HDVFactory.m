//
//  HDVFactory.m
//  HtmlDocumenView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "HDVFactory.h"
#import "APXML.h"

@implementation HDVFactory
+(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
{
    //data to string
    NSString *htmlString = [[NSString alloc]  initWithBytes:[htmlData bytes]
                                                  length:[htmlData length] encoding: NSUTF8StringEncoding];

    //string to document
    APDocument* document = [APDocument documentWithXMLString:htmlString];
    [htmlString release];

    //create damn controller
    UIViewController* controller = [[UIViewController alloc]init];
    
    //convert the document to the view
    controller.view = [HDVFactory viewFromHtmlElement:document.rootElement];
    
    //done
    [controller autorelease];
    return controller;
}

+(UIView*) viewFromHtmlElement:(APElement*) element;
{
    //create the view for the element
    UIView* view = [HDVFactory allocViewForElement:element];

    for(APElement *childElement in [element childElements])
    {
        UIView *subView = [HDVFactory viewFromHtmlElement:childElement];
        [view addSubview:subView];
    }
    
    [view autorelease];
    return view;        
    //for each child element, create the view and add as subview
    
}

+(UIView*) allocViewForElement:(APElement*) element;
{
    UIView *view = nil;
    if([element.name isEqualToString: @"ul"])
    {
        view = [[UITableView alloc]init];
    }
    if([element.name isEqualToString: @"span"])
    {
        view = [[UILabel alloc]init];
        
        [((UILabel*)view) setText:[element value]];
        [((UILabel*)view) sizeToFit];
    }
    if(!view)
        view = [[UIView alloc]init];
    
    return  view;
}
@end
