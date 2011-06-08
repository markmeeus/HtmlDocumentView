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
#import "OQStyles.h"
#import "APElement.h"

@implementation OQDocument
@synthesize document;
-(void)dealloc;
{
    [document release];
    [super dealloc];
}
#pragma mark materializers
-(void)setDefaultMaterlializers;
{
    [self setMaterializer:[[[OQParagraphViewMaterializer alloc]init]autorelease] forOQSelectorString:@"p"];
    [self setMaterializer:[[[OQImageViewMaterializer alloc]init]autorelease] forOQSelectorString:@"img"];
    [self setMaterializer:[[[OQButtonViewMaterializer alloc]init]autorelease] forOQSelectorString:@"a"];

}
-(void)setMaterializer:(OQViewMaterializerBase*)materializer forOQSelectorString:(NSString*) selectorString;
{
    [self attachObject:materializer toElementsMatchingSelectorString:selectorString usingKey:@"materializer"];
}
-(void)attachObject:(id)object toElementsMatchingSelectorString:(NSString*)selectorString usingKey:(NSString*) key;
{
    
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:selectorString];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    for(APElement *element in selectedElements)
    {
        [element.HDVExtensions setObject:object forKey:key];
    }   
}

#pragma mark styles
-(void)setStyle:(OQStyleBase*)style forOQSelectorString:(NSString*) selectorString;
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:selectorString];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    for(APElement *element in selectedElements)
    {
        NSMutableArray *styles = [element.HDVExtensions objectForKey:@"styles"];
        if(styles==nil)
        {
            styles = [NSMutableArray array];
            [element.HDVExtensions setObject:styles forKey:@"styles"];
        }
        [styles addObject:style];
    }
}

-(void)setDefaultStyles;
{
    //method stub for default styles
}

-(BOOL) loadDocument:(NSData*)htmlData;
{
    //data to string
    NSString *htmlString = [[NSString alloc]  initWithBytes:[htmlData bytes]
                                                     length:[htmlData length] encoding: NSUTF8StringEncoding];
    
    //string to document
    self.document = [APDocument documentWithXMLString:htmlString];
    [htmlString release];

    return TRUE;
}

-(UIViewController*) buildController;
{
    
    //add default materializers:
    [self setDefaultMaterlializers];

    //add default styles
    [self setDefaultStyles];
    
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
