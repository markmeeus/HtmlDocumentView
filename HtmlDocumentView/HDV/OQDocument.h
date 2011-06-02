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
#import "OQStyles.h"

@interface OQDocument : NSObject {
    APDocument *document;
}
@property (nonatomic, retain) APDocument *document;

//materializers
-(void)setMaterializer:(OQViewMaterializerBase*)materializer forOQSelectorString:(NSString*) selectorString;
-(void)setDefaultMaterlializers;
//styles
-(void)setStyle:(OQStyleBase*)style forOQSelectorString:(NSString*) selectorString;
-(void)setDefaultStyles;

//attach objects to elements
-(void)attachObject:(id)object toElementsMatchingSelectorString:(NSString*)selectorString usingKey:(NSString*) key;

-(UIViewController*) controllerFromHtmlData:(NSData*)htmlData;
-(UIView*)viewFromDocument;
@end
