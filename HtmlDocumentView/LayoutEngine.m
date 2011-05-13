//
//  LayoutEngine.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "LayoutEngine.h"
#import "APElement.h"

@implementation LayoutEngine

+(void)layoutElement:(APElement*)element;
{
    //pseudo flow:
    //start with recursive call for all children to get the size of the current element
    for(APElement* childElement in element.childElements)
    {
        //make the child do it's layout
        [LayoutEngine layoutElement:childElement];
        //TODOget the childs size and assign it to a frame
            
    }
    //TODO: apply sizes, padding and borders
    
    //apply them to the view
    //
}
@end
