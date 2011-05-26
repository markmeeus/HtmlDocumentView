//
//  ImageViewFactory.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 20/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "OQImageViewMaterializer.h"
#import "APElement.h"

@implementation OQImageViewMaterializer

-(UIView*)createViewForElement:(APElement*)element;
{
    //pretty naive image loading going on here
    NSURL *url = [NSURL URLWithString:[element valueForAttributeNamed:@"src"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
                  
    UIImage *image = [[[UIImage alloc]initWithData:data]autorelease];
    UIImageView *imageView = [[[UIImageView alloc]initWithImage:image]autorelease];
    imageView.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, image.size.width, image.size.height);
    return imageView;
    
}

@end
