//
//  UIColor+Cortica.m
//  ProjectProblem
//
//  Created by Jay on 6/28/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import "UIColor+Cortica.h"

@implementation UIColor (Cortica)


+ (UIColor *)colorForFileExt:(NSString *)extension {
    if ([[extension lowercaseString] isEqualToString:@"plist"]) {
        return [UIColor redColor];
    }
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        return [UIColor blueColor];
    }
    if ([[extension lowercaseString] isEqualToString:@"jpg"]) {
        return [UIColor greenColor];
    }
    if ([[extension lowercaseString  ]isEqualToString:@"xcassets"]) {
        return [UIColor yellowColor];
    }
    if ([[extension lowercaseString] isEqualToString:@"storyboardc"]) {
        return [UIColor purpleColor];
    }
    if ([[extension lowercaseString] isEqualToString:@""]) {
        return [UIColor cyanColor];
    }
    return [UIColor blackColor];
}

@end
