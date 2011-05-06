//
//  HDVFactory.h
//  HtmlDocumenView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APXML.h"

@interface HDVFactory : NSObject {
    
}
+(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;

+(UIView*) viewFromHtmlElement:(APElement*) element;

+(UIView*) allocViewForElement:(APElement*) element;
@end
