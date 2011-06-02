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
    APDocument *document;
}
@property (nonatomic, retain) APDocument *document;

-(void)setMaterializer:(OQViewMaterializerBase*)materializer forOQSelectorString:(NSString*) selectorString;
-(void)setDefaultMaterlializers;
-(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
-(UIView*)viewFromDocument;
@end
