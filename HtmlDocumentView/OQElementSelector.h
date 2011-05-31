//
//  OQElementSelectorBase.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APElement.h"

@interface OQElementSelector : NSObject {
    
}
@property (nonatomic, retain) NSString *elementName;
@property (nonatomic, retain) NSArray *attributeValueSelectors;

-(NSArray*) selectElementsFromElement:(APElement*) element; 

//internal use
-(void) _selectElementsFromElement:(APElement*) element addToArray:(NSMutableArray*) array; 
-(BOOL) matchesElement:(APElement *) element;
@end
