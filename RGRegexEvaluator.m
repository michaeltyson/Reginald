//
//  RGRegexEvaluator.m
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import "RGRegexEvaluator.h"
#import "RegexKitLite.h"

@interface RGRegexEvaluator ()
- (void)evaluate;
@property (nonatomic, retain) NSAttributedString *attributedOutput;
@property (nonatomic, retain) NSArray *captures;
@property (nonatomic, retain) NSString *errorDescription;
@end

@implementation RGRegexEvaluator
@synthesize input, regex, attributedOutput, captures, errorDescription;

+(NSSet *) keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ( [key isEqualToString:@"attributedOutput"] || [key isEqualToString:@"captures"] || [key isEqualToString:@"errorDescription"] ) {
        return [[super keyPathsForValuesAffectingValueForKey:key] setByAddingObjectsFromSet:[NSSet setWithObjects:@"regex", @"input", nil]];
    }
    return [super keyPathsForValuesAffectingValueForKey:key];
}

- (void)dealloc {
    self.regex = nil;
    self.input = nil;
    self.attributedOutput = nil;
    self.captures = nil;
    self.errorDescription = nil;
    [super dealloc];
}

- (void)setRegex:(NSString *)newRegex {
    [newRegex retain];
    if ( regex ) [regex release];
    regex = newRegex;
    
    [self evaluate];
}

- (void)setInput:(NSString *)newInput {
    [newInput retain];
    if ( input ) [input release];
    input = newInput;
    
    [self evaluate];
}


- (void)evaluate {
    if ( !input || [input length] == 0 || !regex || [regex length] == 0 ) {
        self.attributedOutput = nil;
        self.captures = nil;
        self.errorDescription = nil;
        return;
    }
    
    attributedOutput = [[NSMutableAttributedString alloc] initWithString:input attributes:[NSDictionary dictionaryWithObject:[NSFont fontWithName:@"Monaco" size:14] forKey:NSFontAttributeName]];
    captures = [[NSMutableArray alloc] init];
    errorDescription = nil;
    
    NSArray *captureColours = [NSArray arrayWithObjects:
                                [NSColor colorWithCalibratedRed:0.121 green:0.288 blue:0.308 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.203 green:0.482 blue:0.516 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.266 green:0.630 blue:0.674 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.508 green:0.819 blue:0.846 alpha:1.000], 
                                [NSColor colorWithCalibratedRed:0.304 green:0.367 blue:0.328 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.458 green:0.552 blue:0.494 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.582 green:0.701 blue:0.628 alpha:1.000],
                                [NSColor colorWithCalibratedRed:0.694 green:0.837 blue:0.749 alpha:1.000],
                                nil];
    
    NSError *error = nil;
    if ( ![input enumerateStringsMatchedByRegex:regex options:0 inRange:NSMakeRange(0, [input length]) error:&error enumerationOptions:0 usingBlock:^(NSInteger captureCount, NSString * const capturedStrings[captureCount], const NSRange capturedRanges[captureCount], volatile BOOL * const stop) {
        NSMutableDictionary *match = [NSMutableDictionary dictionary];
        [match setObject:[NSNumber numberWithInt:[self.captures count]+1] forKey:@"number"];
        [match setObject:capturedStrings[0] forKey:@"content"];
        [match setObject:[NSValue valueWithRange:capturedRanges[0]] forKey:@"range"];
        
        NSMutableArray *caps = [NSMutableArray arrayWithCapacity:captureCount];
        for ( NSInteger i=0; i<captureCount; i++ ) {
            [caps addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:i], @"number",
                               capturedStrings[i], @"content", 
                               [NSValue valueWithRange:capturedRanges[i]], @"range", nil]];
            [(NSMutableAttributedString*)attributedOutput addAttributes:[NSDictionary dictionaryWithObject:[captureColours objectAtIndex:(i%([captureColours count]/2)) + (([captureColours count]/2)*([captures count]%2))]
                                                                                                    forKey:NSForegroundColorAttributeName]
                                                                  range:capturedRanges[i]];

        }
        [match setObject:caps forKey:@"captures"];
        
        [(NSMutableArray*)captures addObject:match];
    }] ) {
        self.errorDescription = [error localizedDescription];
    }
     
}

@end
