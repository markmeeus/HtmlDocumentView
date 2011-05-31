//
//  OQChainSelector.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQChainSelector.h"
#import "OQElementSelector.h"

@implementation OQChainSelector
+(NSArray *)selectAllElementsForSelectorChain:(NSArray*)selectorChain startingFromElement:(APElement*)element;
{
    //TODO: find clever stuff here
    OQElementSelector *selector = [selectorChain objectAtIndex:0];
    return [selector selectElementsFromElement:element];
}
@end
