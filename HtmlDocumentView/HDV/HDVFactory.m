//
//  HDVFactory.m
//  HtmlDocumenView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "HDVFactory.h"
#import "APXML.h"
#import "BaseViewFactory.h"
#import "APElement.h"
#import "LayoutEngine.h"

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
    UIView* view = [BaseViewFactory viewFromElement:document.rootElement];
    
    //start the layout engine!
    [LayoutEngine layoutElement:document.rootElement];
    
    //assign to the controller
    controller.view = view;
    
    //done
    [controller autorelease];
    return controller;
}



@end
