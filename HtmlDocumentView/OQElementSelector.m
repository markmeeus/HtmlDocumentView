//
//  OQElementSelectorBase.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQElementSelector.h"
#import "OQAttributeValueSelector.h"

@implementation OQElementSelector
@synthesize elementName;
@synthesize attributeValueSelectors;
-(void) dealloc;
{
    [elementName release];
    [attributeValueSelectors release];
    [super dealloc];
}
-(NSArray*) selectElementsFromElement:(APElement*) element; 
{
    NSMutableArray *result = [NSMutableArray array];    
    [self _selectElementsFromElement:element addToArray:result];
    return result;
}
-(void) _selectElementsFromElement:(APElement*) element addToArray:(NSMutableArray*) array; 
{
    if([self matchesElement:element])    
        [array addObject:element];
    
    //call recursively
    for(APElement* childElement in [element childElements])
    {
        [self _selectElementsFromElement:childElement addToArray:array];
    }
    
}
-(BOOL) matchesElement:(APElement *) element;
{
    BOOL elementNameMatches = NO;
    if([self.elementName isEqualToString:@""] || [element.name isEqualToString:self.elementName])
    {
        //if there is no elementname specified on this selector, we can select all elements, so the name matches
        elementNameMatches = YES;
    }
    
    //no attributeValue seletors mean it is ok
    BOOL attributeValueSelectorsMatched = YES;

    for(OQAttributeValueSelector *attributeValueSelector in self.attributeValueSelectors)
    {
        //there are attribute value selectors, they should all match
        attributeValueSelectorsMatched = attributeValueSelectorsMatched && [attributeValueSelector matchesElement:element]; 
    }
    return elementNameMatches && attributeValueSelectorsMatched;
}
@end
