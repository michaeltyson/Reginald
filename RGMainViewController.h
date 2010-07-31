//
//  RGMainViewController.h
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class RGRegexEvaluator;
@interface RGMainViewController : NSObject <NSOutlineViewDelegate> {
    IBOutlet RGRegexEvaluator *evaluator;
    IBOutlet NSTextView *outputView;
}

@end
