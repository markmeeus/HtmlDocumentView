//
//  OQBorderStyle.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 02/06/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OQStyleBase.h"

@interface OQBorderStyle : OQStyleBase {
    UIColor *borderColor;
    float borderWidth;
}
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic) float borderWidth;
@end
