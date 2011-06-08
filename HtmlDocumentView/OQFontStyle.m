//
//  OQFontStyle.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 02/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQFontStyle.h"


@implementation OQFontStyle
@synthesize fontName;
@synthesize size;
-(void)dealloc;
{
    [self.fontName release];
    [super dealloc];
}

-(void)applyToElement:(APElement*)element;
{
    UIView *view = [element.HDVExtensions objectForKey:@"innerView"];
    [view performSelector:@selector(setFont:) withObject:[UIFont fontWithName:self.fontName size:self.size]];
}

@end
