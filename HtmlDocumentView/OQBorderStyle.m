//
//  OQBorderStyle.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 02/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQBorderStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation OQBorderStyle
@synthesize borderColor;
@synthesize borderWidth;

-(void)applyToElement:(APElement *)element;
{
    //add border around view
    UIView *view = [element.HDVExtensions objectForKey:@"view"];    
    [view.layer setBorderColor: [[self borderColor] CGColor]];
    [view.layer setBorderWidth: self.borderWidth];    
}
@end
