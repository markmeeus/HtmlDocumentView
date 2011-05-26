//
//  HDVFactory.m
//  HtmlDocumenView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//


#import "APXML.h"
#import "APElement.h"
#import "OQDocument.h"
#import "OQViewMaterializers.h"
#import "LayoutEngine.h"


@implementation OQDocument
@synthesize materializers;


-(OQDocument*) init;
{
    self = [super init];
    materializers = [[NSMutableDictionary alloc]init];
    [self registerDefaultViewMaterializers];
    return self;
}
-(void)dealloc;
{
    [materializers release];
    [super dealloc];
}

-(void)registerDefaultViewMaterializers;
{
    [self registerViewMaterializer:[[[OQParagraphViewMaterializer alloc]init]autorelease] forDOMSelector:@"p"];
    [self registerViewMaterializer:[[[OQImageViewMaterializer alloc]init]autorelease] forDOMSelector:@"img"];
}

-(void)registerViewMaterializer:(OQViewMaterializerBase*)materializer forDOMSelector:(NSString*)DOMSelector;
{
    [materializers setObject:materializer forKey:DOMSelector];    
}

-(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
{
    //data to string
    NSString *htmlString = [[NSString alloc]  initWithBytes:[htmlData bytes]
                                                  length:[htmlData length] encoding: NSUTF8StringEncoding];

    //string to document
    APDocument* document = [APDocument documentWithXMLString:htmlString];
    [htmlString release];

    //create controller
    UIViewController* controller = [[UIViewController alloc]init];
    
    //convert the document to the view
    UIView* view = [self viewFromDocument:document];
    
    //start the layout engine!
    CGPoint point = CGPointMake(0, 0);
    [LayoutEngine layoutElement:document.rootElement startingAt:point];
    
    //assign to the controller
    controller.view = view;
    
    //done
    [controller autorelease];
    return controller;
}

-(UIView*)viewFromDocument:(APDocument*)document;
{
    //Create a base materializer and make it build the view
    OQViewMaterializerBase* materializer = [[OQViewMaterializerBase alloc] initWithDocument:self];
    
    UIView* view = [materializer buildViewForElement:document.rootElement];
    
    [materializer release];
    return view;
}

@end
