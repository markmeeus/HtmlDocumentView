//
//  OQBackgroundStyle.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 02/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQBackgroundStyle.h"


@implementation OQBackgroundStyle
@synthesize color;

-(void) dealloc;
{
    [color release];
    [super dealloc];
}

-(void)applyToElement:(APElement*)element;
{
    
    UIView *view = [element.HDVExtensions objectForKey:@"innerView"];
    view.backgroundColor = [UIColor clearColor];
    
    view = [element.HDVExtensions objectForKey:@"view"];
    view.backgroundColor = self.color;
    NSLog(@"VIEW HEIGHT: %@",view.frame.size.height);
}
@end
