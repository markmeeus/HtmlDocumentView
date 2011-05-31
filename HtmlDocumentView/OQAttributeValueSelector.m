//
//  OQAttributeValueSelector.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQAttributeValueSelector.h"


@implementation OQAttributeValueSelector
@synthesize  attributeName;
@synthesize attributeValue;
-(void)dealloc
{
    [attributeValue release];
    [attributeName release];
    [super dealloc];
}

-(BOOL) matchesElement:(APElement *) element;
{
    //if we are dealing with 'class', we need to check for values separated by @" "
    NSString *rawAttributeValue = [element valueForAttributeNamed:self.attributeName];
    for(NSString *attributeValue in [rawAttributeValue componentsSeparatedByString:@" "])
    {
        if([attributeValue isEqualToString:self.attributeValue])
            return YES;
    }
    return NO;
}
@end
