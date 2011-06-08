//
//  HtmlDocumentViewAppDelegate.h
//  HtmlDocumentView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OQDocument.h"
@interface HtmlDocumentViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
-(void)addTestStylesToDocument:(OQDocument*)document;
@end
