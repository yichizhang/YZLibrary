//
//  NSString+YZLibrary.m
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

#import "NSString+YZLibrary.h"
#import "NSObject+YZLibrary.h"
#import "NSCharacterSet+YZLibrary.h"

@implementation NSString (YZLibrary)

- (BOOL)yz_isValidEmail{
	
	if([self length]==0){
		return NO;
	}
 
	NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
 
	NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
	NSUInteger regExMatches = [regEx numberOfMatchesInString:self options:0 range:[self yz_fullRange]];
 
	if (regExMatches == 0) {
		return NO;
	} else {
		return YES;
	}
}

- (NSRange)yz_fullRange{
	return NSMakeRange(0, self.length);
}

- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock {
	[self yz_findString:string options:options range:[self yz_fullRange] handlingBlock:handlingBlock];
}

- (void)yz_findString:(NSString*)string options:(NSStringCompareOptions)options range:(NSRange)range handlingBlock:(void (^)(NSRange range, NSInteger index, BOOL* stop))handlingBlock {
	
	NSInteger origStart = range.location;
	NSInteger origLength = range.length;
	NSInteger count = 0;
	while (range.location != NSNotFound) {
		range = [self rangeOfString:string options:options range:range];
		if (range.location != NSNotFound) {
			BOOL stop;
			handlingBlock(range, count, &stop);
			
			if (stop) {
				return;
			}
			
			NSUInteger newStart = range.location + range.length;
			range = NSMakeRange(newStart, origStart + origLength - newStart);
			
		}
	}
}

- (NSDate*)yz_dateFromString:(NSString*)dateFormat{
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = dateFormat;
	return [formatter dateFromString:self];
}

+ (NSString*)yz_stringFromBool:(BOOL)boolValue{
	
	return (boolValue ? @"true" : @"false");
	
}

+ (NSString *)yz_letterStringFromNumber1To26:(NSInteger)number{
	
	NSString* returnName = @"?";
	
	int asciiCodeOfCapitalA = 'A';
	
	char theChar;
	
	if (number>=1 && number<=26) {
		
		theChar = asciiCodeOfCapitalA + number - 1;
		returnName = [NSString stringWithFormat:@"%c", theChar];
		
	}
	
	return returnName;
}

+ (NSString*)yz_stringFromInt:(NSInteger)intNumber{
	
	return [NSString stringWithFormat:@"%li", (long)intNumber];
}

- (BOOL)yz_isDigitsOnly
{
	NSCharacterSet* setOfNonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
	NSRange range = [self rangeOfCharacterFromSet: setOfNonDigits];
	return range.location == NSNotFound;
}

- (NSString*)yz_humanReadableString
{
	NSMutableString *newString = [@"" mutableCopy];
	[self yz_enumerateCVariableNameWordsUsingBlock:^(NSString *word, BOOL *stop) {
		if (newString.length > 0) {
			[newString appendString:@" "];
		}
		[newString appendString:[word lowercaseString]];
	}];
	return [newString copy];
}

- (NSString*)yz_underscoreCaseString {
	return [self yz_underscoreCaseStringWithOptions:YZStringConversionNone];
}

- (NSString*)yz_underscoreCaseStringWithOptions:(YZStringConversion)options {
	NSMutableString *newString = [@"" mutableCopy];
	[self yz_enumerateCVariableNameWordsUsingBlock:^(NSString *word, BOOL *stop) {
		if (newString.length > 0) {
			[newString appendString:@"_"];
		}
		
		if (options & YZStringConversionRetainOriginalLetterCase) {
			[newString appendString:word];
		} else {
			[newString appendString:[word lowercaseString]];
		}
	}];
	return [newString copy];
}

- (NSString*)yz_camelCaseString {
	return [self yz_camelCaseStringWithOptions:YZStringConversionRetainOriginalLetterCase];
}

- (NSString*)yz_camelCaseStringWithOptions:(YZStringConversion)options {
	NSMutableString *newString = [@"" mutableCopy];
	[self yz_enumerateCVariableNameWordsUsingBlock:^(NSString *word, BOOL *stop) {

		if (
			(options & YZStringConversionRetainOriginalLetterCase) == YES &&
			newString.length == 0
			) {
			// If option `RetainOriginalLetterCase` is YES, and it is the first word;
			// do not change the word to `capitalizedString`.
			// We have to change the word to `capitalizedString` if it is NOT the first word,
			// even option `RetainOriginalLetterCase` is YES --- otherwise it wouldn't be
			// camel case string would it?
			[newString appendString:word];
		} else {
			[newString appendString:[word capitalizedString]];
		}
	}];
	return [newString copy];
}

- (void)yz_enumerateCVariableNameWordsUsingBlock:(void (^)(NSString *word, BOOL* stop))handlingBlock {
	
	NSMutableString *currentWord = [NSMutableString new];
	
	NSCharacterSet *lowercaseSet = [NSCharacterSet lowercaseLetterCharacterSet];
	NSCharacterSet *digitSet = [NSCharacterSet decimalDigitCharacterSet];
	NSCharacterSet *uppercaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
	NSCharacterSet *ignoreSet = [NSCharacterSet characterSetWithCharactersInString:@"\'\""];
	
	BOOL outputCurrentWord = NO;
	BOOL appendCurrentChar = NO;
	BOOL appendBeforeOutput = NO;
	unichar lastChar = '\0';
	BOOL stop = NO;
	
	for (NSInteger location = 0; location < self.length && stop == NO; location ++) {
		unichar currentChar = [self characterAtIndex:location];
	
		appendCurrentChar = NO;
		appendBeforeOutput = YES;
		if ( [uppercaseSet characterIsMember:currentChar] ) {
			// An uppercase letter
			outputCurrentWord = YES;
			appendCurrentChar = YES;
			appendBeforeOutput = NO;
		} else if ( [lowercaseSet characterIsMember:currentChar] ) {
			// A lowercase letter
			if ( [digitSet characterIsMember:lastChar] ) {
				outputCurrentWord = YES;
				appendCurrentChar = YES;
				appendBeforeOutput = NO;
			} else {
				appendCurrentChar = YES;
			}
		} else if ( [digitSet characterIsMember:currentChar] ) {
			// A digit
			if ( [digitSet characterIsMember:lastChar] ) {
				appendCurrentChar = YES;
			} else {
				outputCurrentWord = YES;
				appendCurrentChar = YES;
				appendBeforeOutput = NO;
			}
		} else if ( [ignoreSet characterIsMember:currentChar] ){
			// Symbols to be "ignored"
			outputCurrentWord = NO;
		} else {
			// Symbols to be replaced with underscore
			outputCurrentWord = YES;
		}
		
		if (location == self.length - 1) {
			// Last character. Out put current word.
			outputCurrentWord = YES;
		}
		
		if (appendCurrentChar && appendBeforeOutput == YES) {
			[currentWord appendFormat:@"%c", currentChar];
			appendCurrentChar = NO;
		}
		
		if (outputCurrentWord) {
			if (currentWord.length > 0) {
				handlingBlock([currentWord copy], &stop);
				currentWord = [@"" mutableCopy];
			}
			outputCurrentWord = NO;
		}
		
		if (appendCurrentChar && appendBeforeOutput == NO) {
			[currentWord appendFormat:@"%c", currentChar];
			appendCurrentChar = NO;
		}
		
		if (location == self.length - 1) {
			// Handles the case if the last character is a "word"
			// by itself
			if (currentWord.length > 0) {
				handlingBlock([currentWord copy], &stop);
				currentWord = [@"" mutableCopy];
			}
		}
		
		lastChar = currentChar;
	}
}

@end
