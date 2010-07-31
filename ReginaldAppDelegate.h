//
//  ReginaldAppDelegate.h
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ReginaldAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
