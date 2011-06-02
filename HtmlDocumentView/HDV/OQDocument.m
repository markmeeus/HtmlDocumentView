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
#import "OQSelectors.h"
#import "APElement.h"

@implementation OQDocument

-(void)dealloc;
{
    [document release];
    [super dealloc];
}
-(void)setDefaultMaterlializers;
{
    [self setMaterializer:[[[OQParagraphViewMaterializer alloc]init]autorelease] forOQSelectorString:@"p"];
    [self setMaterializer:[[[OQImageViewMaterializer alloc]init]autorelease] forOQSelectorString:@"img"];

}
-(void)setMaterializer:(OQViewMaterializerBase*)materializer forOQSelectorString:(NSString*) selectorString;
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:selectorString];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    for(APElement *element in selectedElements)
    {
        [element.HDVExtensions setObject:materializer forKey:@"materializer"];
    }
}
-(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
{
    //data to string
    NSString *htmlString = [[NSString alloc]  initWithBytes:[htmlData bytes]
                                                  length:[htmlData length] encoding: NSUTF8StringEncoding];

    //string to document
    document = [APDocument documentWithXMLString:htmlString];
    [htmlString release];

    //add default materializers:
    [self setDefaultMaterlializers];
    
    //create controller
    UIViewController* controller = [[UIViewController alloc]init];
    
    //convert the document to the view
    UIView* view = [self viewFromDocument];
    
    //start the layout engine!
    CGPoint point = CGPointMake(0, 0);
    [LayoutEngine layoutElement:document.rootElement startingAt:point];
    
    //assign to the controller
    controller.view = view;
    
    //done
    [controller autorelease];
    return controller;
}

-(UIView*)viewFromDocument;
{
    //Create a base materializer and make it build the view
    OQViewMaterializerBase* materializer = [[OQViewMaterializerBase alloc] init];
    
    UIView* view = [materializer buildViewForElement:document.rootElement];
    
    [materializer release];
    return view;
}

@end
