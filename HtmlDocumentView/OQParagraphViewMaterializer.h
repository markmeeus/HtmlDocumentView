//
//  ParagraphViewFactory.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OQViewMaterializerBase.h"


@interface OQParagraphViewMaterializer : OQViewMaterializerBase {
    
}
- (void)sizeLabel:(UILabel*)label ToFitFixedWidth:(NSInteger)fixedWidth;
@end
