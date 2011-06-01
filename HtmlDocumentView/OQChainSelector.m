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
    //start with this one element
    NSArray *selectedElements = [[NSArray alloc]initWithObjects: element,nil];
    for(OQElementSelector *selector in selectorChain)
    {
        //select elements in each selected element
        NSMutableArray *nextRoundOfSelectedElements = [NSMutableArray array];
        for(APElement *selectedElement in selectedElements)
        {
            //Add all selected elements of all selected elements to the array
            [nextRoundOfSelectedElements addObjectsFromArray:[selector selectElementsFromElement:selectedElement]];
        }
        //prepare for next run, the new set of selected elements, is the one returned by the current selector
        selectedElements = nextRoundOfSelectedElements;
    }
    
    return selectedElements;
}
@end
