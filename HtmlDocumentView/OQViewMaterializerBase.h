//
//  HDViewFactoryBase.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APElement.h"

@interface OQViewMaterializerBase : NSObject {
    id document; //id allow for other document implementations. Duck typing
}
@property (nonatomic, retain) id document;
-(OQViewMaterializerBase*)initWithDocument:(id) document;
-(OQViewMaterializerBase*)getMaterializerForElement:(APElement*)element;
-(UIView*)buildViewForElement:(APElement*)element;
-(UIView*)createViewForElement:(APElement*)element;
-(UIView*)createBorderFrameAroundView:(UIView*)view;
@end
