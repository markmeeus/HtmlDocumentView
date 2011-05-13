//
//  SpanViewControler.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "SpanViewFactory.h"


@implementation SPANViewFactory

+(UIView*)createView:(APElement *)element;
{
    UILabel* view =  [[[UILabel alloc]init] autorelease];
    [view setText:[element value]];
    [view sizeToFit];
    return view;
}
@end
