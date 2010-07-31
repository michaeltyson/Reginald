//
//  ReginaldAppDelegate.m
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import "ReginaldAppDelegate.h"
#import "RGAttributedStringValueTransformer.h"

@implementation ReginaldAppDelegate

@synthesize window;

+ (void)initialize {
    // Register value transformers
    [NSValueTransformer setValueTransformer:[[[RGAttributedStringValueTransformer alloc] init] autorelease] forName:@"RGAttributedStringValueTransformer"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

@end
