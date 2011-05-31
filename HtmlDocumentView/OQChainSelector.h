//
//  OQChainSelector.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APElement.h"

@interface OQChainSelector : NSObject {
    
}
+(NSArray *)selectAllElementsForSelectorChain:(NSArray*)selectorChain startingFromElement:(APElement*)element;
@end
