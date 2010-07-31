//
//  RGMainViewController.m
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import "RGMainViewController.h"
#import "RGRegexEvaluator.h"

@implementation RGMainViewController

- (void)awakeFromNib {
    evaluator.input = NSLocalizedString(@"Enter text here to apply the above regular expression upon", @"");
    evaluator.regex = @"[A-Za-z]+";
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item {
    NSRange range = [[[item representedObject] valueForKey:@"range"] rangeValue];
    [outputView setSelectedRange:range];
    return YES;
}

@end
