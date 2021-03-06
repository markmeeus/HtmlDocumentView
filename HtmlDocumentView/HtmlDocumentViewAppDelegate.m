//
//  HtmlDocumentViewAppDelegate.m
//  HtmlDocumentView
//
//  Created by Mark Meeus on 04/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "HtmlDocumentViewAppDelegate.h"
#import "OQDocument.h"

@implementation HtmlDocumentViewAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //load the root html
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"root" ofType:@"html"];  
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    OQDocument* document = [[OQDocument alloc]init];
    [document loadDocument:htmlData];
    
    [self addTestStylesToDocument:document];
    
    
    self.window.rootViewController = [document buildController];
    [self.window makeKeyAndVisible];

    [document release];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark test methods
-(void)addTestStylesToDocument:(OQDocument*)document;
{
    //add some styles
    OQBackgroundStyle* backgroundStyle = [[[OQBackgroundStyle alloc]init]autorelease];
    backgroundStyle.color = [UIColor yellowColor];
    [document setStyle:backgroundStyle forOQSelectorString:@"body"];        

    backgroundStyle = [[[OQBackgroundStyle alloc]init]autorelease];
    backgroundStyle.color = [UIColor redColor];
    //[document setStyle:backgroundStyle forOQSelectorString:@"p"];        
 
    OQFontStyle *fontStyle = [[[OQFontStyle alloc]init]autorelease];
    fontStyle.fontName = @"American Typewriter";
    fontStyle.size = 15;
    [document setStyle:fontStyle forOQSelectorString:@"p"];   
    
    OQBorderStyle *borderStyle = [[[OQBorderStyle alloc]init]autorelease];
    borderStyle.borderColor = [UIColor greenColor];
    borderStyle.borderWidth = 3.2;
    [document setStyle:borderStyle forOQSelectorString:@"p.bordered"];
}

@end
