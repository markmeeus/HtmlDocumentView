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
}
@property (nonatomic, retain) id document;
-(OQViewMaterializerBase*)getMaterializerForElement:(APElement*)element;
-(void)applyStylesToViewForElement:(APElement*)element;
-(UIView*)buildViewForElement:(APElement*)element;
-(void)addSubView:(UIView*)subView ToElement:(APElement*)element;
-(UIView*)createViewForElement:(APElement*)element;
-(UIView*)createBorderFrameAroundView:(UIView*)view;
@end
