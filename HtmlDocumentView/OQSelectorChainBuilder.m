//
//  OQSelectorChainBuilder.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQSelectorChainBuilder.h"
#import "OQElementSelector.h"
#import "OQAttributeValueSelector.h"

@implementation OQSelectorChainBuilder
+ (NSArray*) buildSelectorChainForString:(NSString*)selectorString;
{
    //split the selector string by spaces
    NSArray *elementSelectors = [selectorString componentsSeparatedByString:@" "];
    NSMutableArray *result = [NSMutableArray array];
    for(NSString *elementSelectorString in elementSelectors)
    {
        //split each element selector with a '.'
        NSArray *classSelectors = [elementSelectorString componentsSeparatedByString:@"."];
        
        NSString *elementName = [classSelectors objectAtIndex:0]; //first item is the element name, all the others are class specifiers            
        
        
        NSMutableArray *attributeValueSelectors = [NSMutableArray array];
        //all the others are class selectors
        for(int i =1; i< [classSelectors count]; i++)
        {
            OQAttributeValueSelector *attributeValueSelector = [[OQAttributeValueSelector alloc]init];
            attributeValueSelector.attributeName = @"class";
            attributeValueSelector.attributeValue = [classSelectors objectAtIndex:i];
            [attributeValueSelectors addObject:attributeValueSelector];
            [attributeValueSelector release];
        }
        
        OQElementSelector *selector = [[OQElementSelector alloc]init];
        selector.elementName = elementName;
        selector.attributeValueSelectors = attributeValueSelectors;
        [result addObject:selector];
        [selector release];
    }
    return result;
}
@end
