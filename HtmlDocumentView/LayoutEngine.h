//
//  LayoutEngine.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 13/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APElement.h"

@interface LayoutEngine : NSObject {
    
}
+(CGRect)layoutElement:(APElement*)element startingAt:(CGPoint) point;
@end
