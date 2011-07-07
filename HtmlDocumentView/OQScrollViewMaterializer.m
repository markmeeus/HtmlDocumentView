//
//  OQScrollViewMaterializer.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 10/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQScrollViewMaterializer.h"


@implementation OQScrollViewMaterializer
-(UIView*)createViewForElement:(APElement*)element;
{
    UIScrollView *scrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)]autorelease];
    [scrollView setScrollEnabled:YES];
    return scrollView;
}
@end
