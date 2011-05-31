//
//  TestOQSelectors.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "TestOQSelectors.h"
#import "OQSelectorChainBuilder.h"
#import "OQElementSelector.h"
#import "OQChainSelector.h"

@implementation TestOQSelectors
-(void) setUp
{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"html"];  
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    //data to string
    NSString *htmlString = [[NSString alloc]  initWithBytes:[htmlData bytes]
                                                     length:[htmlData length] encoding: NSUTF8StringEncoding];
    
    //string to document
    document = [APDocument documentWithXMLString:htmlString];
    [htmlString release];    
}
-(void) tearDown
{
    
}
-(void) testSelectSingleFirstElement
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:@"body"];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    STAssertEquals([selectedElements count], 1U, @"");
    APElement *element = [selectedElements objectAtIndex:0];
    STAssertEqualObjects(element.name, @"body",@"");
}

-(void) testSelectClassOnlySelector
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:@".test"];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    STAssertEquals([selectedElements count], 3U, @"");
    id firstElement = [selectedElements objectAtIndex:0];
    STAssertEqualObjects([firstElement name], @"p",@"");
    id secondElement = [selectedElements objectAtIndex:1];
    STAssertEqualObjects([secondElement name], @"img",@"");
    
}

-(void) testSelectElementAndClassSelector
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:@"p.test"];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];   
    STAssertEquals([selectedElements count], 1U, @"");
    id firstElement = [selectedElements objectAtIndex:0];
    STAssertEqualObjects([firstElement name], @"p",@"");    
}

-(void) testSelectMultipleClassSelector
{
    NSArray *selectorChain = [OQSelectorChainBuilder buildSelectorChainForString:@"ul li.test img.avatar .highlighted"];
    NSArray *selectedElements = [OQChainSelector selectAllElementsForSelectorChain:selectorChain startingFromElement:document.rootElement];
    STAssertEquals([selectedElements count], 1U, @"");
    id firstElement = [selectedElements objectAtIndex:0];
    STAssertEqualObjects([firstElement name], @"img",@"");    
}

@end
