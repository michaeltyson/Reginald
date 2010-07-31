//
//  RGRegexEvaluator.h
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RGRegexEvaluator : NSObject {
    NSString *regex;
    NSString *input;
    
    NSAttributedString *attributedOutput;
    NSArray *captures;
    NSString *errorDescription;
}

- (NSAttributedString*)attributedOutput;
- (NSArray*)captures;
- (NSString*)errorDescription;

@property (nonatomic, retain) NSString *regex;
@property (nonatomic, retain) NSString *input;

@end
