//
//  OQAttributeValueSelector.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APElement.h"

@interface OQAttributeValueSelector : NSObject {
    
}
@property (nonatomic, retain) NSString *attributeName;
@property (nonatomic, retain) NSString *attributeValue;

-(BOOL) matchesElement:(APElement *) element;
@end
