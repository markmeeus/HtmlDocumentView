//
//  PViewFactory.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "PViewFactory.h"


@implementation PViewFactory
+(UIView*)createView:(APElement *)element;
{
    UIView* view =  [[[UIView alloc]init] autorelease];
    [((UILabel*)view) setText:[element value]];
    [((UILabel*)view) sizeToFit];
    return view;
}
@end
