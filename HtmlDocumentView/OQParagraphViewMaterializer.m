//
//  ParagraphViewFactory.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQParagraphViewMaterializer.h"


@implementation OQParagraphViewMaterializer

-(UIView*)createViewForElement:(APElement*)element;
{
    UILabel *label = [[[UILabel alloc]init]autorelease];
    label.text = [element.value  stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self sizeLabel:label ToFitFixedWidth:320];
    return label;

}

- (void)sizeLabel:(UILabel*)label ToFitFixedWidth:(NSInteger)fixedWidth
{
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, fixedWidth, 0);
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    [label sizeToFit];
}

@end
