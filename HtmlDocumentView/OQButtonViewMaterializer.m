//
//  OQButtonViewMaterializer.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 08/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQButtonViewMaterializer.h"


@implementation OQButtonViewMaterializer

-(UIView*)createViewForElement:(APElement*)element;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle: [element.value  stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forState:UIControlStateNormal];
    CGRect frame = CGRectMake(0,0,320,40);
    button.frame = frame;
    return button;
    
}

@end
