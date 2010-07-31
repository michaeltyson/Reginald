//
//  RGAttributedStringValueTransformer.m
//  Reginald
//
//  Created by Michael Tyson on 31/07/2010.
//  Copyright 2010 A Tasty Pixel. All rights reserved.
//

#import "RGAttributedStringValueTransformer.h"


@implementation RGAttributedStringValueTransformer

+ (Class)transformedValueClass { return [NSString class]; }
+ (BOOL)allowsReverseTransformation { return YES; }

- (id)transformedValue:(id)value {
    return (value == nil) ? nil : [[[NSAttributedString alloc] 
                                    initWithString:(NSString*)value 
                                    attributes:[NSDictionary dictionaryWithObject:[NSFont fontWithName:@"Monaco" size:14] forKey:NSFontAttributeName]] autorelease];
}

- (id)reverseTransformedValue:(id)value {
    return (value == nil) ? nil : [(NSAttributedString*)value string];
}


@end
