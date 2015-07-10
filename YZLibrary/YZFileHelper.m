//
//  YZFileHelper.m
//  YZLibrary
//
//  Copyright (c) 2015 Yichi Zhang
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "YZFileHelper.h"

@implementation YZFileHelper

+ (NSString *)userDocumentDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    return documentDir;
}

+ (NSString *)pathForDirectoryInUserDomain:(NSSearchPathDirectory)directory {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
	return [paths firstObject];
}

+ (NSString*)fileSizeStringFromByteCount:(int)byteCount {
    //For converting file size to MB, Gb use below function
    double value = (double)byteCount;
    int multiplyFactor = 0;
    
    NSArray *units = [NSArray arrayWithObjects:@"bytes",@"KiB",@"MiB",@"GiB",@"TiB",nil];
    
    while (value > 1024) {
        value /= 1024;
        multiplyFactor++;
    }
	
    return [NSString stringWithFormat:@"%4.1f %@",
			value,
			[units objectAtIndex:multiplyFactor]
			];
}

@end
