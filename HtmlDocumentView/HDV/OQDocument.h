//
//  HDVFactory.h
//  HtmlDocumenView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APXML.h"
#import "OQViewMaterializers.h"


@interface OQDocument : NSObject {
    NSMutableDictionary* materializers;
}
@property (nonatomic, retain) NSMutableDictionary* materializers;

-(void)registerViewMaterializer:(OQViewMaterializerBase*)materializer forDOMSelector:(NSString*)DOMSelector;
-(void)registerDefaultViewMaterializers;
-(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
-(UIView*)viewFromDocument:(APDocument*)document;
@end
