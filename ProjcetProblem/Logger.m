//
//  Logger.m
//  ProjectProblem
//
//  Created by Jay on 6/28/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import "Logger.h"

@implementation Logger


+ (void)logLine:(NSString *)logLine {
    if (logLine) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"fileLog"];
        NSString *logString = [NSString stringWithFormat:@"%@\n\r",logLine];
        NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:appFile];
        if (!fileHandler) {
            [[NSFileManager defaultManager] createFileAtPath:appFile contents:nil attributes:nil];
            fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:appFile];
        }
        [fileHandler seekToEndOfFile];
        [fileHandler writeData:[logString dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandler closeFile];
    }
}
@end
