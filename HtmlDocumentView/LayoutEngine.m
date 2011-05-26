//
//  LayoutEngine.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "LayoutEngine.h"
#import "APElement.h"
#import <QuartzCore/QuartzCore.h>


@implementation LayoutEngine

+(CGRect)layoutElement:(APElement*)element startingAt:(CGPoint) point;
{
    int x,y,width,height, totalChildHeight;
    x=point.x;y=point.y;width = 0;height=0;totalChildHeight=0;
    
    //recursively layout all child elements
    for(APElement* childElement in element.childElements)
    {
     
        CGPoint point = CGPointMake(x, y);
        CGRect elementFrame = [LayoutEngine layoutElement:childElement startingAt:point];
        y = elementFrame.origin.y + elementFrame.size.height;
        //increase y. This is pure block level stuff
        totalChildHeight += elementFrame.size.height;
                    
    }
    //all child elements have a layout, let's layout this!
    UIView *thisView = ((UIView*)[element.HDVExtensions objectForKey:@"view"]);
    CGRect thisFrame = thisView.frame;

    //add the height of the childframes
    thisFrame = CGRectMake(point.x, point.y , thisFrame.size.width, thisFrame.size.height );
    thisView.frame = thisFrame;                       
    
    //add border around view
    [thisView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [thisView.layer setBorderWidth: 2.0];

    
    return thisFrame;
}
@end
